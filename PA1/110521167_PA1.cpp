#include <iostream>
#include <vector>
#include <unordered_map>
#include <fstream>
#include <sstream>
#include <ctime>
using namespace std;

#ifdef DEBUG_MODE
#define DEBUG 1
#else
#define DEBUG 0
#endif

struct gate;
typedef vector<gate *> gatePtrVec;
struct gate
{
    string name, type, from;
    gatePtrVec input, output;

    gate(string _name, string _type) : name(_name), type(_type) {}
};

class Linker
{
private:
    vector<pair<gate *, vector<int>>> gate_index; // store input gates' index
    unordered_map<int, gate *> index2gate;        // index to gate
    unordered_map<string, gate *> name2gate;      // gateName to gate

public:
    ~Linker();

    // operations of private variable
    void pushVec_gate_index(gate *, vector<int> &);
    void insertMap_index2gate(int, gate *);
    void insertMap_name2gate(string &, gate *);

    // gate linker
    void connectGate();
    gatePtrVec getSortedGateList();
};

class Parser
{
private:
    string inFile, outFile, caseName;
    Linker lk;
    ifstream ifs;
    ofstream ofs;

    // sub functions of inputISC()
    string gotoFirstInfo();
    void loadGateInfo(string &);

    // sub functions of outputVerilog()
    tuple<gatePtrVec, gatePtrVec, gatePtrVec> classify(gatePtrVec &gateList);
    void rename(gatePtrVec &, string);
    void outputDeclare(gatePtrVec &input, gatePtrVec &interior, gatePtrVec &output);
    void outputGate(gatePtrVec &interior, gatePtrVec &output);

public:
    Parser(string &, string &);
    ~Parser();
    bool openFile();
    gatePtrVec inputISC();
    void outputVerilog(gatePtrVec &gateList);
};

int main(int argc, char **argv)
{
    const string caseName = "c6288";
    string inFile = argc == 1 ? caseName + ".isc" : argv[1];
    string outFile = argc == 1 ? caseName + ".v" : argv[2];

    Parser ps(inFile, outFile);
    double t0;
    if (ps.openFile())
    {
        if (DEBUG)
            t0 = clock();

        gatePtrVec gateList = ps.inputISC();
        ps.outputVerilog(gateList);

        if (DEBUG)
            cout << "Excution time = " << (clock() - t0) / double(CLOCKS_PER_SEC) << "sec" << endl;

        return EXIT_SUCCESS;
    }
    else
    {
        cerr << "Failed to open" << endl;
        return EXIT_FAILURE;
    }
}

// class Linker implementation
// private
void Linker::pushVec_gate_index(gate *g, vector<int> &v) { gate_index.push_back(make_pair(g, v)); }
void Linker::insertMap_index2gate(int index, gate *g) { index2gate.insert(make_pair(index, g)); }
void Linker::insertMap_name2gate(string &name, gate *g) { name2gate.insert(make_pair(name, g)); }
// public
Linker::~Linker()
{
    for (auto &it : gate_index)
        delete it.first;
}
void Linker::connectGate()
{
    for (auto &g_i : gate_index)
    {
        for (auto &index : g_i.second)
        {
            auto it = index2gate.find(index);
            gate *fromGate = it->second;
            if (!fromGate->from.empty())
            {
                // if fromGate is a wire, find its source
                gate *tmp = fromGate;
                fromGate = name2gate.find(fromGate->from)->second;
                delete tmp;
                it->second = nullptr;
            }

            g_i.first->input.push_back(fromGate);
            fromGate->output.push_back(g_i.first);
        }
    }
}
gatePtrVec Linker::getSortedGateList()
{
    // sort by index, exluding from-type
    gatePtrVec list;
    for (auto &it : index2gate)
        if (it.second != nullptr)
            list.push_back(it.second);
    return list;
}

// class Parser implementation
// private
string Parser::gotoFirstInfo()
{
    string line;
    do
    {
        getline(ifs, line);
    } while (line.front() == '*');
    return line;
}
void Parser::loadGateInfo(string &line)
{
    gate *g;
    string index, name, type;
    istringstream iss(line);

    iss >> index >> name >> type;
    if (type == "buff")
        type.pop_back(); // buff -> buf
    g = new gate(name, type);
    lk.insertMap_index2gate(stoi(index), g);
    lk.insertMap_name2gate(name, g);

    if (type == "inpt")
    {
        vector<int> v;
        lk.pushVec_gate_index(g, v);
    }
    else if (type == "from")
        iss >> g->from;
    else
    {
        getline(ifs, line);
        istringstream iss(line);
        string tmp;
        vector<int> index;
        while (iss >> tmp)
            index.push_back(stoi(tmp));
        lk.pushVec_gate_index(g, index);
    }
}
tuple<gatePtrVec, gatePtrVec, gatePtrVec> Parser::classify(gatePtrVec &gateList)
{
    gatePtrVec input, interior, output;
    for (auto &g : gateList)
    {
        if (g->input.empty())
            input.push_back(g);
        else if (g->output.empty())
            output.push_back(g);
        else
            interior.push_back(g);
    }
    return make_tuple(input, interior, output);
}
void Parser::rename(gatePtrVec &gateList, string name_suffix)
{
    for (auto &g : gateList)
    {
        string tmp = name_suffix;
        auto it = g->name.begin();
        for (; it != g->name.end();)
            if (isdigit(*it))
                tmp.push_back(*it++);
            else
                break;
        g->name.erase(g->name.begin(), it);
        g->name.append(tmp);
    }
}
void Parser::outputDeclare(gatePtrVec &input, gatePtrVec &interior, gatePtrVec &output)
{
    ofs << "module " << caseName << " (" << input.front()->name;
    for (auto it = input.begin() + 1; it != input.end(); it++)
        ofs << ", " << (*it)->name;
    for (auto it = output.begin(); it != output.end(); it++)
        ofs << ", " << (*it)->name;
    ofs << ");" << endl
        << "input ";
    for (auto &g : input)
        ofs << g->name << (g == input.back() ? ";\noutput " : ", ");
    for (auto &g : output)
        ofs << g->name << (g == output.back() ? ";\nwire " : ", ");
    for (auto &g : interior)
        ofs << g->name << (g == interior.back() ? ";\n" : ", ");
}
void Parser::outputGate(gatePtrVec &interior, gatePtrVec &output)
{
    for (auto &g : interior)
    {
        string name = g->name;
        name.erase(name.find('_'), 4); // erase "_out"
        ofs << g->type << " " << name << " (" << g->name;
        for (auto &in : g->input)
            ofs << ", " << in->name;
        ofs << ");" << endl;
    }
    for (auto &g : output)
    {
        string name = g->name;
        name.erase(name.find('_'), 4); // erase "_out"
        ofs << g->type << " " << name << " (" << g->name;
        for (auto &in : g->input)
            ofs << ", " << in->name;
        ofs << ");" << endl;
    }
}
// public
Parser::Parser(string &_inFile, string &_outFile) : inFile(_inFile), outFile(_outFile)
{
    caseName.assign(outFile.begin(), outFile.end() - 2);
    ifs.open(inFile);
    if (ifs.is_open())
        ofs.open(outFile);
}
Parser::~Parser()
{
    ifs.close();
    ofs.close();
}
bool Parser::openFile() { return ifs.is_open() && ofs.is_open(); }
gatePtrVec Parser::inputISC()
{
    // load input.isc information
    string line = gotoFirstInfo();
    do
    {
        loadGateInfo(line);
    } while (getline(ifs, line));

    // handle from-type wiring, connect all gates
    lk.connectGate();

    return lk.getSortedGateList();
}
void Parser::outputVerilog(gatePtrVec &gateList)
{
    // classify gates
    gatePtrVec input, interior, output;
    tie(input, interior, output) = classify(gateList);

    // rename according syntax
    rename(input, "");
    rename(interior, "_out");
    rename(output, "_out");

    // output
    ofs << "`timescale 1ns/1ps" << endl;
    outputDeclare(input, interior, output);
    outputGate(interior, output);
    ofs << "endmodule";
}