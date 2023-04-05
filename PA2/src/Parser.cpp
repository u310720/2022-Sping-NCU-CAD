// parser.cpp
#include "Parser.h"
#include <iostream>
#include <algorithm>
#include <set>

Parser::Parser(int argc, char **argv)
{
    fname = argc == 1 ? "testcase2" : argv[1];
}

void Parser::readNodes(ifstream &ifs, map<int, Node *> &nodeMap, int nNode)
{
    int ID;
    char symbol;
    for (int i = 0; i < nNode; ++i)
    {
        ifs >> ID >> symbol;
        nodeMap[ID] = new Node(ID, symbol);
    }
}
void Parser::readEdges(ifstream &ifs, map<int, Node *> &nodeMap, DAG *graph, int nEdge)
{
    Node *from, *to;
    int fromNodeID, toNodeID;
    set<Node *> inNodeNext;
    for (int i = 0; i < nEdge; ++i)
    {
        ifs >> fromNodeID >> toNodeID;
        from = nodeMap.find(fromNodeID)->second;
        to = nodeMap.find(toNodeID)->second;
        if (from->opType == Node::NOP)
            inNodeNext.insert(to);
        else if (to->opType == Node::NOP)
        {
            from->suc.push_back(graph->TNOP);
            graph->TNOP->pre.push_back(from);
        }
        else
        {
            from->suc.push_back(to);
            to->pre.push_back(from);
        }
    }
    for (const auto &it : inNodeNext)
    {
        graph->SNOP->suc.push_back(it);
        it->pre.push_back(graph->SNOP);
    }
}
void Parser::extractOperation(map<int, Node *> &nodeMap, DAG *graph)
{
    graph->nOperation = 0;
    graph->operation.reserve(nodeMap.size());
    for (auto &it : nodeMap)
    {
        if (it.second->opType == Node::NOP)
            delete it.second;
        else
        {
            graph->nOperation++;
            graph->operation.push_back(it.second);
        }
    }
}
DAG *Parser::readInput()
{
    ifstream ifs(fname);
    if (!ifs.is_open())
    {
        cout << "Could not open." << endl;
        exit(1);
    }

    DAG *graph = new DAG;
    int nNode, nEdge;
    map<int, Node *> nodeMap; // first is Node_ID, second is Node_ptr
    ifs >> graph->max_latency >> nNode >> nEdge;
    graph->TNOP->ts = graph->TNOP->tl = graph->max_latency + 1;
    readNodes(ifs, nodeMap, nNode);
    readEdges(ifs, nodeMap, graph, nEdge);
    extractOperation(nodeMap, graph);
    ifs.close();
    
    return graph;
}

pair<int, int> Parser::getResorceNum(vector<TimeSlot> &opExeTime)
{
    int maxADD = 0, maxMUL = 0;
    for (const auto &it : opExeTime)
    {
        maxADD = maxADD < it.nADD ? it.nADD : maxADD;
        maxMUL = maxMUL < it.nMUL ? it.nMUL : maxMUL;
    }
    return make_pair(maxADD, maxMUL);
}
void Parser::outputResult(vector<TimeSlot> &opExeTime)
{
    int nADD, nMUL;
    tie(nADD, nMUL) = getResorceNum(opExeTime);

    ofstream ofs(fname + ".out");
    ofs << nADD << endl
        << nMUL;
    for (auto &slot : opExeTime)
    {
        if (slot.op.empty())
            continue;

        stable_sort(slot.op.begin(), slot.op.end(),
                    [](Node *n1, Node *n2)
                    { return n1->ID < n2->ID; });
        ofs << endl
            << slot.op[0]->ID;
        for (int i = 1, size = slot.nADD + slot.nMUL; i < size; ++i)
            ofs << " " << slot.op[i]->ID;
    }
    ofs.close();
}
