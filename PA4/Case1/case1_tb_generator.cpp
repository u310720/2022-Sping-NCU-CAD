#include <iostream>
#include <fstream>
#include <sstream>
#include <vector>
#include <bitset>
using namespace std;

string moduleLine, moduleName;

struct bitArray
{
    int bits;
    string name;

    bitArray(int b, const string &n) : bits(b), name(n) {}
};

vector<bitArray> input, output;
int inputBits = 0;

void setTimescale(ifstream &ifs, ofstream &ofs)
{
    string line;
    while (getline(ifs, line))
    {
        if (line.find("`timescale") != string::npos)
            break;
    }
    ofs << line << endl
        << endl;
}

void setModule(ifstream &ifs, ofstream &ofs)
{
    while (getline(ifs, moduleLine))
    {
        if (moduleLine.find("module") != string::npos)
            break;
    }
    for (int idx = moduleLine.find("module") + 6; moduleLine[idx] != '('; ++idx)
    {
        if (moduleLine[idx] != ' ')
            moduleName.push_back(moduleLine[idx]);
    }
    ofs << "module " << moduleName + "_tb;" << endl;

    string line, tmp;
    istringstream iss;
    while (getline(ifs, line))
    {
        if (line.find("input") != string::npos)
        {
            if (line.find("//") != string::npos)
                line.erase(line.begin() + line.find("//"), line.end());

            line.replace(line.find("input"), 5, "reg");
            ofs << line << endl;

            int MSB, LSB, bits;
            tmp = string(line.begin() + line.find("[") + 1, line.begin() + line.find("]"));
            tmp.replace(tmp.find(":"), 1, " ");
            iss.str(tmp);
            iss >> MSB >> LSB;
            bits = MSB > LSB ? MSB - LSB + 1 : LSB - MSB + 1;
            iss.clear();

            iss.str(string(line.begin() + line.find("]") + 1, line.end()));
            while (iss >> tmp)
            {
                while (tmp.back() == ';' || tmp.back() == ',' || tmp.back() == ' ')
                    tmp.pop_back();
                input.emplace_back(bits, tmp);
                inputBits += bits;
            }
            iss.clear();
        }
        else if (line.find("output") != string::npos)
        {
            if (line.find("//") != string::npos)
                line.erase(line.begin() + line.find("//"), line.end());

            line.replace(line.find("output"), 6, "wire");
            ofs << line << endl;

            int MSB, LSB, bits;
            tmp = string(line.begin() + line.find("[") + 1, line.begin() + line.find("]"));
            tmp.replace(tmp.find(":"), 1, " ");
            iss.str(tmp);
            iss >> MSB >> LSB;
            bits = MSB > LSB ? MSB - LSB + 1 : LSB - MSB + 1;
            iss.clear();

            iss.str(string(line.begin() + line.find("]") + 1, line.end()));
            while (iss >> tmp)
            {
                while (tmp.back() == ';' || tmp.back() == ',' || tmp.back() == ' ')
                    tmp.pop_back();
                output.emplace_back(bits, tmp);
            }
            iss.clear();
        }
    }

    ofs << moduleName << " " << moduleName + "1(" << input[0].name;
    for (int idx = 1; idx < input.size(); ++idx)
        ofs << ", " << input[idx].name;
    for (const auto &wire : output)
        ofs << ", " << wire.name;
    ofs << ");" << endl;
}

void setBody(ofstream &ofs)
{
    /*cout << inputBits << endl;
    unsigned long long int cnt = 0, upperBound = pow(2, inputBits);*/
    ofs << "integer sim;" << endl;

    ofs << "initial" << endl
        << "begin" << endl;

    ofs << "    sim = $fopen(\"" << moduleName << "_simulation.txt\", \"w\");" << endl
        << endl;

    ofs << "    "
        << "$fsdbDumpfile(\"" << moduleName << ".fsdb\");" << endl;
    ofs << "    "
        << "$fsdbDumpvars(0," << moduleName + "_tb);" << endl;

    ofs << "    #0  ";
    ofs << input[0].name << " = " << input[0].bits << "'h" << hex << 0x0 << ";   ";
    ofs << input[1].name << " = " << input[1].bits << "'h" << hex << 0x0 << ";" << endl;
    ofs << "    #1  ";
    ofs << "    $fwrite(sim, \"a=%b b=%b    result=(%b, %b, %b)\", a, b, result[2], result[1], result[0]);" << endl;
    ofs << "    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))" << endl
        << "        $fwrite(sim, \"X\\n\");" << endl
        << "    else" << endl
        << "        $fwrite(sim, \"\\n\");" << endl;
    for (int cnt = 1; cnt < 256; ++cnt)
    {
        ofs << "    #5  ";
        ofs << input[0].name << " = " << input[0].bits << "'h" << hex << ((cnt & 0xf0) >> 4) << ";   ";
        ofs << input[1].name << " = " << input[1].bits << "'h" << hex << (cnt & 0x0f) << ";" << endl;
        ofs << "    #1  ";
        ofs << "    $fwrite(sim, \"a=%b b=%b    result=(%b, %b, %b)\", a, b, result[2], result[1], result[0]);" << endl;
        ofs << "    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))" << endl
            << "        $fwrite(sim, \"X\\n\");" << endl
            << "    else" << endl
            << "        $fwrite(sim, \"\\n\");" << endl;
    }
    ofs << "    #5  $finish;" << endl
        << endl;

    ofs << "$fclose(sim);" << endl;

    ofs << "end" << endl
        << "endmodule";
}

int main()
{
    ifstream ifs("Comparator_4bits.v");
    ofstream ofs("PA4_110521167_case1_tb.v");

    setTimescale(ifs, ofs);
    setModule(ifs, ofs);
    setBody(ofs);

    ifs.close();
    ofs.close();

    return 0;
}