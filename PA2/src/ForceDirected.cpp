// ForceDirected.cpp
#include "ForceDirected.h"
#include <algorithm>
#include <climits>

ForceDirected::ForceDirected(DAG *_graph)
{
    graph = _graph;
    max_latency = _graph->max_latency;
    nOpNotAssigned = _graph->nOperation;
    qADD.assign(max_latency, 0);
    qMUL.assign(max_latency, 0);
    bestTime.assign(nOpNotAssigned, 0);
    opExeTime.resize(max_latency);
    for(auto slot : opExeTime)
        slot.op.reserve(nOpNotAssigned / 4);
}

void ForceDirected::initialNodeTsTl(vector<Node *> &topoOrder)
{
    for (auto &curOp : topoOrder)
    {
        curOp->ts = -1;
        curOp->tl = max_latency;
        for (const auto &preOp : curOp->pre)
        {
            switch (preOp->opType)
            {
            case Node::NOP:
            case Node::ADD:
                curOp->ts = preOp->ts + ADD_CYCLE > curOp->ts ? preOp->ts + ADD_CYCLE : curOp->ts;
                break;
            case Node::MUL:
                curOp->ts = preOp->ts + MUL_CYCLE > curOp->ts ? preOp->ts + MUL_CYCLE : curOp->ts;
                break;
            }
        }
    }
    reverse(topoOrder.begin(), topoOrder.end());
    for (const auto &curOp : topoOrder)
    {
        for (const auto &preOp : curOp->pre)
        {
            switch (preOp->opType)
            {
            case Node::NOP:
            case Node::ADD:
                preOp->tl = curOp->tl - ADD_CYCLE < preOp->tl ? curOp->tl - ADD_CYCLE : preOp->tl;
                break;
            case Node::MUL:
                preOp->tl = curOp->tl - MUL_CYCLE < preOp->tl ? curOp->tl - MUL_CYCLE : preOp->tl;
                break;
            }
        }
    }
    graph->SNOP->tl = -1;
    graph->TNOP->ts = max_latency;
    graph->SNOP->isAssigned = graph->TNOP->isAssigned = true;
}

void ForceDirected::topoDFS(Node *curOp, vector<Node *> &stack)
{
    curOp->flag = true; // marked as visited
    for (const auto &sucOp : curOp->suc)
        if (sucOp->flag == false)
            topoDFS(sucOp, stack);
    stack.push_back(curOp);
}
vector<Node *> ForceDirected::topologicalSort()
{
    vector<Node *> topoOrder;
    for (auto &v : graph->operation)
        v->flag = false;
    topoDFS(graph->SNOP, topoOrder);
    reverse(topoOrder.begin(), topoOrder.end());
    return topoOrder;
}

void ForceDirected::initialQk()
{
    for (auto &op : graph->operation)
        op->prob = 1.0 / (1 + op->mobility());
    for (int time = 0; time < max_latency; ++time)
    {
        for (const auto &op : graph->operation)
        {
            switch (op->opType)
            {
            case Node::ADD:
                qADD[time] += op->getTimeProb(time);
                break;
            case Node::MUL:
                qMUL[time] += op->getTimeProb(time);
                break;
            }
        }
    }
}

double ForceDirected::calcSelfForce(Node *curOp, int curTime)
{
    // maybe can be optimized
    double selfForce = 0;
    switch (curOp->opType)
    {
    case Node::ADD:
        for (int time = curOp->ts; time <= curOp->tl; ++time)
            selfForce += qADD[time] * (time == curTime ? 1 : -1);
        break;
    case Node::MUL:
        for (int time = curOp->ts; time <= curOp->tl; ++time)
            selfForce += qMUL[time] * (time == curTime ? 1 : -1);
        break;
    }
    selfForce *= curOp->prob;

    return selfForce;
}
double ForceDirected::calcPreForce(Node *preOp, int new_preTl)
{
    if (new_preTl >= preOp->tl || preOp == graph->SNOP)
        return 0;

    double sum_qPre = 0, new_sum_qPre,
           new_prob = 1.0 / (1 + new_preTl - preOp->ts);

    switch (preOp->opType)
    {
    case Node::ADD:
        for (int time = preOp->ts; time <= preOp->tl; ++time)
            sum_qPre += qADD[time];

        new_sum_qPre = sum_qPre;
        for (int time = preOp->tl; time > new_preTl; --time)
            new_sum_qPre -= qADD[time];
        break;
    case Node::MUL:
        for (int time = preOp->ts; time <= preOp->tl; ++time)
            sum_qPre += qMUL[time];

        new_sum_qPre = sum_qPre;
        for (int time = preOp->tl; time > new_preTl; --time)
            new_sum_qPre -= qMUL[time];
        break;
    }

    return new_prob * new_sum_qPre - preOp->prob * sum_qPre;
}
double ForceDirected::calcSucForce(Node *sucOp, int new_sucTs)
{
    if (new_sucTs <= sucOp->ts || sucOp == graph->TNOP)
        return 0;

    double sum_qSuc = 0, new_sum_qSuc,
           new_prob = 1.0 / (1 + sucOp->tl - new_sucTs);

    switch (sucOp->opType)
    {
    case Node::ADD:
        for (int time = sucOp->ts; time <= sucOp->tl; ++time)
            sum_qSuc += qADD[time];

        new_sum_qSuc = sum_qSuc;
        for (int time = sucOp->ts; time < new_sucTs; ++time)
            new_sum_qSuc -= qADD[time];
        break;
    case Node::MUL:
        for (int time = sucOp->ts; time <= sucOp->tl; ++time)
            sum_qSuc += qMUL[time];

        new_sum_qSuc = sum_qSuc;
        for (int time = sucOp->ts; time < new_sucTs; ++time)
            new_sum_qSuc -= qMUL[time];
        break;
    }

    return new_prob * new_sum_qSuc - sucOp->prob * sum_qSuc;
}
double ForceDirected::calcForce(Node *curOp, int tryTime)
{
    double totalForce = 0;
    totalForce += calcSelfForce(curOp, tryTime);
    for (const auto &sucOp : curOp->suc)
    {
        switch (curOp->opType)
        {
        case Node::NOP:
            break;
        case Node::ADD:
            totalForce += calcSucForce(sucOp, tryTime + ADD_CYCLE);
            break;
        case Node::MUL:
            totalForce += calcSucForce(sucOp, tryTime + MUL_CYCLE);
            break;
        }
    }
    for (const auto &preOp : curOp->pre)
    {
        switch (preOp->opType)
        {
        case Node::NOP:
            break;
        case Node::ADD:
            totalForce += calcPreForce(preOp, tryTime - ADD_CYCLE);
            break;
        case Node::MUL:
            totalForce += calcPreForce(preOp, tryTime - MUL_CYCLE);
            break;
        }
    }

    return totalForce;
}

pair<Node *, int> ForceDirected::selectOp()
{
    int assignTime;
    double curForce, minForce = INT_MAX;
    Node *curOp, *minForceOp;

    for (int i = 0; i < graph->nOperation; ++i)
    {
        curOp = graph->operation[i];
        if(curOp->isAssigned)
            continue;

        curOp->force = INT_MAX;
        for (int time = curOp->ts; time <= curOp->tl; ++time)
        {
            curForce = calcForce(curOp, time);
            if (curForce < curOp->force)
            {
                curOp->force = curForce;
                bestTime[i] = time;
            }
        }
    }
    for(int i = 0; i < graph->nOperation; ++i)
    {
        curOp = graph->operation[i];
        // cout << curOp->force << " "; // for debug
        if(curOp->isAssigned)
            continue;
        
        if (curOp->force < minForce || curOp->force == minForce && curOp->opType == Node::MUL)
        {
            minForce = curOp->force;
            minForceOp = curOp;
            assignTime = bestTime[i];
        }
    }
    /*cout << endl; // for debug
    for(auto &itTime : bestTime) // for debug
        cout << itTime << " ";
    cout << endl; // for debug*/

    return make_pair(minForceOp, assignTime);
}

void ForceDirected::fixPreTl(Node *op, int nextOpTl)
{
    if(op->isAssigned)
        return;

    int new_tl;
    double new_prob;

    switch (op->opType)
    {
    case Node::ADD:
        new_tl = nextOpTl - ADD_CYCLE;
        if (op->tl <= new_tl)
            return;

        //fix probability
        new_prob = 1.0 / (1 + new_tl - op->ts);
        for(int time = op->ts; time <= op->tl; ++time)
            qADD[time] -= op->prob;
        for(int time = op->ts; time <= new_tl; ++time)
            qADD[time] += new_prob;
        break;
    case Node::MUL:
        new_tl = nextOpTl - MUL_CYCLE;
        if (op->tl <= new_tl)
            return;

        //fix probability
        new_prob = 1.0 / (1 + new_tl - op->ts);
        for(int time = op->ts; time <= op->tl; ++time)
            qMUL[time] -= op->prob;
        for(int time = op->ts; time <= new_tl; ++time)
            qMUL[time] += new_prob;
        break;
    default:
        break;
    }
    op->tl = new_tl;
    op->prob = new_prob;

    //fix predecessor
    for (auto &preOp : op->pre)
        fixPreTl(preOp, op->tl);
}
void ForceDirected::fixSucTs(Node *op, int new_ts)
{
    if (new_ts <= op->ts || op->isAssigned)
        return;

    double new_prob = 1.0 / (1 + op->tl - new_ts);
    switch (op->opType)
    {
    case Node::ADD:
        //fix probability
        for(int time = op->ts; time <= op->tl; ++time)
            qADD[time] -= op->prob;
        for(int time = new_ts; time <= op->tl; ++time)
            qADD[time] += new_prob;

        // fix successor
        for (auto &sucOp : op->suc)
            fixSucTs(sucOp, new_ts + ADD_CYCLE);
        break;
    case Node::MUL:
        //fix probability
        for(int time = op->ts; time <= op->tl; ++time)
            qMUL[time] -= op->prob;
        for(int time = new_ts; time <= op->tl; ++time)
            qMUL[time] += new_prob;
        
        // fix successor
        for (auto &sucOp : op->suc)
            fixSucTs(sucOp, new_ts + MUL_CYCLE);
        break;
    default:
        break;
    }
    op->ts = new_ts;
    op->prob = new_prob;
}
void ForceDirected::fixProb(Node *op, int assignTime)
{
    switch(op->opType)
    {
        case Node::ADD:
            for(int time = op->ts; time <= op->tl; ++time)
                qADD[time] -= op->prob;
            qADD[assignTime] += 1;
        break;
        case Node::MUL:
            for(int time = op->ts; time <= op->tl; ++time)
                qMUL[time] -= op->prob;
            qMUL[assignTime] += 1;
        break;
        default:
            break;
    }
    op->prob = 1;
}
void ForceDirected::assignOp(Node *op, int assignTime)
{
    op->isAssigned = true;
    nOpNotAssigned--;
    fixProb(op, assignTime);
    op->ts = op->tl = assignTime;
    insertOpExeTime(op);

    for (auto &sucOp : op->suc)
    {
        switch (op->opType)
        {
        case Node::ADD:
            fixSucTs(sucOp, assignTime + ADD_CYCLE);
            break;
        case Node::MUL:
            fixSucTs(sucOp, assignTime + MUL_CYCLE);
            break;
        default:
            break;
        }
    }
    for (auto &preOp : op->pre)
        fixPreTl(preOp, op->tl);

    for(auto itOp : graph->operation)
    {
        if(itOp->ts == itOp->tl && !itOp->isAssigned)
        {
            insertOpExeTime(itOp);
            itOp->isAssigned = true;
            nOpNotAssigned--;
        }
    }
}

void ForceDirected::insertOpExeTime(Node *op)
{
    switch (op->opType)
    {
    case Node::ADD:
        for(int time = op->ts; time < op->ts + ADD_CYCLE; time++)
            opExeTime[time].insert(op);
        break;
    case Node::MUL:
        for(int time = op->ts; time < op->ts + MUL_CYCLE; time++)
            opExeTime[time].insert(op);
        break;
    }
}

void ForceDirected::ASAP_ALAP()
{
    vector<Node *> topoOrder = topologicalSort(); // determine topological order & reverse topological order
    initialNodeTsTl(topoOrder);                   // ASAP & ALAP
    initialQk();
}

int ForceDirected::get_nOpNotAssigned() const { return nOpNotAssigned; }

/*void ForceDirected::scheduling()
{
    vector<Node *> topoOrder = topologicalSort(); // determine topological order & reverse topological order
    initialNodeTsTl(topoOrder);                   // ASAP & ALAP
    initialQk();

    int assignTime;
    Node *minForceOp;
    
    // sort(graph->operation.begin(), graph->operation.end(), [](Node *n1, Node *n2){return n1->ID < n2->ID;}); // for debug
    while(nOpNotAssigned > 0)
    {
        tie(minForceOp, assignTime) = selectOp();
        assignOp(minForceOp, assignTime);
        // cout << minForceOp->ID << " " << assignTime << endl; // for debug
    }
}*/