#ifndef _DS_H__
#define _DS_H__

#include <vector>
using std::vector;
#define MUL_CYCLE 3
#define ADD_CYCLE 1

struct Node
{
    enum operation_type
    {
        NOP, // non of operation
        ADD, // 1 cycle operation
        MUL  // 3 cycle operation
    };
    bool flag, isAssigned;
    int ID, opType,
        ts, tl;
    vector<Node *> pre, suc;
    double prob, force; // probability & force

    int mobility() { return tl - ts; }
    double getTimeProb(int time) { return ts <= time && time <= tl ? prob : 0; }
    Node(int _ID, char symbol) : ID(_ID)
    {
	pre.reserve(4);
	suc.reserve(4);
        flag = isAssigned = false;
        ts = tl = -1;
        switch (symbol)
        {
        case 'i':
        case 'o':
            opType = NOP;
            break;
        case '+':
            opType = ADD;
            break;
        case '*':
            opType = MUL;
            break;
        default:
            opType = -1; // ERROR
            break;
        }
    }
};

struct DAG
{
    int max_latency, nOperation;
    Node *SNOP, *TNOP;
    vector<Node *> operation;

    DAG()
    {
        SNOP = new Node(-1, 'i');
        TNOP = new Node(-1, 'i');
    }
    ~DAG()
    {
        delete SNOP;
        delete TNOP;
        for (auto &op : operation)
            delete op;
    }
};

struct TimeSlot
{
    int nADD, nMUL;
    vector<Node *> op;

    void insert(Node *n)
    {
        switch (n->opType)
        {
        case Node::ADD:
            op.push_back(n);
            ++nADD;
            break;
        case Node::MUL:
            op.push_back(n);
            ++nMUL;
            break;
        default:
            break;
        }
    }
};

#endif
