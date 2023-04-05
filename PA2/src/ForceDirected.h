#ifndef _FORCEDIRECTED_H__
#define _FORCEDIRECTED_H__

#include "DS.h"
#include <vector>
#include <iostream> // for debug
#include <algorithm> // for tie()
using namespace std;

class ForceDirected
{
private:
    int max_latency, nOpNotAssigned;
    DAG *graph;
    vector<double> qADD, qMUL;
    vector<int> bestTime; // for selectOp()

    void topoDFS(Node *, vector<Node *> &);
    vector<Node *> topologicalSort();

    void initialNodeTsTl(vector<Node *> &);

    void initialNodeTsTl();
    void initialQk();

    double calcForce(Node *, int);
    double calcSelfForce(Node *, int);
    double calcSucForce(Node *, int);
    double calcPreForce(Node *, int);

    void fixPreTl(Node *, int);
    void fixSucTs(Node *, int);
    void fixProb(Node *, int);

    void insertOpExeTime(Node *);

public:
    vector<TimeSlot> opExeTime; // for parser output()
    ForceDirected(DAG *);
    // void scheduling();
    void ASAP_ALAP();
    pair<Node *, int> selectOp();
    void assignOp(Node *, int);
    int get_nOpNotAssigned() const;
};

#endif