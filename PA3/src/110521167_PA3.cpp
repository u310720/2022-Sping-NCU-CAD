#include <iostream>
#include <fstream>
#include <vector>
#include <unordered_map>
#include <ctime>
#include <climits>
#include "net.h"
#include "node.h"
// #include "bucket.h" // for debug, call showAllGainBuckets()
#include "fm.h"
using namespace std;

void read(const string &file)
{
    ifstream ifs(file);
    if(!ifs)
    {
        cerr << "Input ERROR." << endl;
        exit(1);
    }

    string line, str;
    unordered_map<string, vector<int>> nodeName_netIndex;

    for(int netNum = 0; ifs >> str; netNum++)
    {
        Net::allNets.emplace_back();
        ifs >> Net::allNets[netNum].name >> str;

        while(ifs >> str && str[0] != '}')
        {
            auto targetNode = nodeName_netIndex.find(str);
            if(targetNode == nodeName_netIndex.end()) // node does not exist
            {
                Node::allNodes.emplace_back(str); // create new node
                nodeName_netIndex.insert(make_pair(str, vector<int>(1, netNum))); // insert new node name and net's index of allNets in this line
            }
            else
                targetNode->second.emplace_back(netNum);
        }
    }

    for(auto &node : Node::allNodes)
    {
        for(auto &netIndex : nodeName_netIndex.find(node.name)->second)
        {
            node.nets.emplace_back(&Net::allNets[netIndex]);
            Net::allNets[netIndex].nodes.emplace_back(&node);
        }
    }

    for(auto &node : Node::allNodes)
    {
        for(auto it = node.nets.begin(); it != node.nets.end();)
        {
            if((*it)->nodes.size() == 1)
                node.nets.erase(it);
            else
                it++;
        }
    }
}

void write(const string &file, int cutSize, const vector<bool> &bestPartition)
{
    vector<Node *> allNodesPtr(Node::numNodes, nullptr);
    for(int i = 0; i < Node::numNodes; i++)
    {
        Node::allNodes[i].setSide(bestPartition[i]);
        allNodesPtr[i] = &Node::allNodes[i];
    }
    Node::sort(allNodesPtr.begin(), allNodesPtr.end());

    ofstream ofs(file);
    ofs << "cut_size " << cutSize << endl;

    ofs << "A" << endl;
    for(const auto &node : allNodesPtr)
        if(node->onLeft())
            ofs << node->name << endl;

    ofs << "B" << endl;
    for(const auto &node : allNodesPtr)
        if(node->onRight())
            ofs << node->name << endl;

    ofs.close();
}

double runtime(const double startTime)
{
    return (clock() - startTime) / CLOCKS_PER_SEC;
}

int main(int argc, char **argv)
{
    static const double startTime = clock();
    const double RUNTIME_LIMIT = argc == 4 ? stoi(argv[3]) : 3000;
    
    string inFile = argc == 1 ? "input1" : argv[1],
           outFile = inFile + ".out";
    read(inFile);

    FM fm(0.2); // initialize with a unbalance ratio, i.e., set balance constraint as (number of cells / unbalance ratio)
    srand(time(NULL));
    int bestCutSize = INT_MAX;
    int roundCnt = 0; // for debug
    vector<bool> bestPartition(Node::numNodes, false);
    while(runtime(startTime) < RUNTIME_LIMIT)
    {
        roundCnt++; // for debug
        srand(rand() * rand() + rand() );
        fm.randomInit();

        // Node::showAllNodes(); // for debug
        // Net::showAllNets(); // for debug

        int noImproveCnt = 0;
        while(noImproveCnt < 3)
        {
            // GainBucket::showAllGainBuckets(); // for debug
            fm.pass();

            if(fm.get_maxGain() > 0)
                noImproveCnt = 0;
            else
                noImproveCnt++;
        }
        fm.checkBalance();

        // cout << fm.calcCutSize() << endl; // for debug
        // GainBucket::showAllGainBuckets(); // for debug

        if(fm.calcCutSize() < bestCutSize)
        {
            bestCutSize = fm.calcCutSize();
            for(int i = 0; i < Node::numNodes; i++)
                bestPartition[i] = Node::allNodes[i].getSide();
            // cout << "cut size = " << bestCutSize << endl; // for debug
        }
    }
    write(outFile, bestCutSize, bestPartition);
    // cout << "runtime = " << runtime(startTime) << "s\n"; // for debug
    // cout << "round = " << roundCnt << endl; // for debug

    return 0;
}
