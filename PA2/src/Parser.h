#ifndef _PARSER_H__
#define _PARSER_H__

#include <vector>
#include <map>
#include <fstream>
#include "DS.h"
#include "ForceDirected.h"
using namespace std;

class Parser
{
private:
    string fname;

    void readNodes(ifstream &, map<int, Node *> &, int);
    void readEdges(ifstream &, map<int, Node *> &, DAG *, int);
    void extractOperation(map<int, Node *> &, DAG *);

    pair<int, int> getResorceNum(vector<TimeSlot> &);

public:
    Parser(int, char **);
    DAG *readInput();
    void outputResult(vector<TimeSlot> &);
};

#endif