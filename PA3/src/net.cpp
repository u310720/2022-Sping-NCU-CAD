// net.cpp
#include "net.h"

// private
void Net::calcLRSize()
{
    LSize = RSize = 0;
    for(const auto &n : nodes)
    {
        if(n->onRight())
            RSize++;
        else
            LSize++;
    }
}

// public
vector<Net> Net::allNets;

int Net::calcGain(Node *node)
{
    // Assume that all nets contain nodes >= 2
    if(LSize == 0 || RSize == 0)
        return -1; // Nodes are all on the same side
    else if(LSize == 1 && node->onLeft() || RSize == 1 && node->onRight())  
        return 1; // Only the node are on different sides
    else
        return 0; // The net is not critical net
}

// for debug
#include <iostream>
#include <algorithm>
using namespace std;

void Net::showAllNets()
{
    sort(allNets.begin(), allNets.end(), [](const Net &n1, const Net &n2)
    {
        return n1.name < n2.name;
    });
    for(auto &net : allNets)
    {
        sort(net.nodes.begin(), net.nodes.end(), [](Node *n1, Node *n2)
        {
            return n1->name < n2->name;
        });
        cout << "NET " << net.name << endl << "Node { ";
        for(const auto &node : net.nodes)
            cout << node->name << " ";
        cout << "}" << endl;
        cout << "LSize = " << net.LSize << endl;
        cout << "RSize = " << net.RSize << endl;
    }
    cout << endl;
}
