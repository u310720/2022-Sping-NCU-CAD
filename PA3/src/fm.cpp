// fm.cpp
#include "fm.h"
#include <vector>
#include <cmath> // for abs()
#include <climits>
#include <iostream> // for debug
using namespace std;

// private
bool FM::violateBalanceConstraint()
{
    // equal to !((totalLSize + 1) - totalRSize < balanceBound && (totalRSize + 1) - totalLSize < balanceBound || totalLSize == totalRSize)
    return ((totalLSize + 1) - totalRSize >= balanceBound || (totalRSize + 1) - totalLSize >= balanceBound)
           && totalLSize != totalRSize;
}

void FM::randomPartition(Node &node)
{
    node.setSide(rand() % 2);
    if(node.onRight())
    {
        totalRSize++;
        for(auto &net : node.nets)
            net->RSize++;
    }
    else
    {
        totalLSize++;
        for(auto &net : node.nets)
            net->LSize++;
    }
}

void FM::initNets()
{
    for(auto &net : Net::allNets)
        net.LSize = net.RSize = 0;
}

void FM::initNodes()
{
    // initize which side the node belongs to, and update connected nets LSize and RSize
    totalLSize = totalRSize = 0;
    for(auto &node : Node::allNodes)
    {
        if(violateBalanceConstraint())
        {
            if(totalLSize > totalRSize)
            {
                node.setSide(Node::RIGHT);
                totalRSize++;
                for(auto &net : node.nets)
                    net->RSize++;
            }
            else // totalLSize < totalRSize
            {
                node.setSide(Node::LEFT);
                totalLSize++;
                for(auto &net : node.nets)
                    net->LSize++;
            }
        }
        else
            randomPartition(node);
    }

    // initialize all nodes gain
    for(int i = 0; i < Node::numNodes; i++)
        Node::allNodes[i].calcGain();
}

void FM::initBucketList()
{
    LGainBucket.clear();
    RGainBucket.clear();

    // Calculate node.gain and insert it into the appropriate bucket
    for(auto &node : Node::allNodes)
    {
        if(node.onLeft())
            LGainBucket.insert(&node);
        else
            RGainBucket.insert(&node);
    }
}

void FM::RtoL()
{
    moveNode = RGainBucket.getMaxGainNode();
    moveNode->toLeft(LGainBucket, RGainBucket);
    totalLSize++;
    totalRSize--;
}

void FM::LtoR()
{
    moveNode = LGainBucket.getMaxGainNode();
    moveNode->toRight(LGainBucket, RGainBucket);
    totalLSize--;
    totalRSize++;
}

void FM::randomMoveStep()
{
    if(rand() % 2)
        RtoL();
    else
        LtoR();
}

void FM::balanceMoveStep()
{
    if(totalLSize > totalRSize)
        LtoR();
    else // totalLSize < totalRSize
        RtoL();
}

void FM::reloadFoward()
{
    for(stepCnt = 0; stepCnt <= bestStep; stepCnt++)
    {
        if(stepList[stepCnt]->onLeft())
        {
            stepList[stepCnt]->toRight(LGainBucket, RGainBucket);
            totalLSize--;
            totalRSize++;
        }
        else
        {
            stepList[stepCnt]->toLeft(LGainBucket, RGainBucket);
            totalLSize++;
            totalRSize--;
        }
    }
    for(stepCnt = 0; stepCnt <= bestStep; stepCnt++)
    {
        stepList[stepCnt]->calcGain();
        if(stepList[stepCnt]->onLeft())
            LGainBucket.insert(stepList[stepCnt]);
        else
            RGainBucket.insert(stepList[stepCnt]);
        stepList[stepCnt]->unlock();
    }
}
void FM::reloadBackward()
{
    for(stepCnt = Node::numNodes - 1; stepCnt > bestStep; stepCnt--)
    {
        if(stepList[stepCnt]->onLeft())
        {
            stepList[stepCnt]->toRight(LGainBucket, RGainBucket);
            totalLSize--;
            totalRSize++;
        }
        else
        {
            stepList[stepCnt]->toLeft(LGainBucket, RGainBucket);
            totalLSize++;
            totalRSize--;
        }
    }
    for(stepCnt = Node::numNodes - 1; stepCnt > bestStep; stepCnt--)
    {
        stepList[stepCnt]->calcGain();
        if(stepList[stepCnt]->onLeft())
            LGainBucket.insert(stepList[stepCnt]);
        else
            RGainBucket.insert(stepList[stepCnt]);
        stepList[stepCnt]->unlock();
    }
}

void FM::reloadBestPartition()
{
    static const int halfOfNumNodes = Node::numNodes / 2;
    Node::unlockAllNodes();
    reloadNodeGain();
    initBucketList();

    if(bestStep > halfOfNumNodes)
        reloadBackward();
    else
        reloadFoward();
}

// public
FM::FM(double unbalanced_ratio) : balanceBound(Node::numNodes * unbalanced_ratio),
    StepRecorder(Node::numNodes)
{
    GainBucket::setPMax(Node::calcMaxDegree());
    LGainBucket.bucketList.assign(2 * LGainBucket.getPMax() + 1, Bucket());
    RGainBucket.bucketList.assign(2 * RGainBucket.getPMax() + 1, Bucket());
}

int FM::get_maxGain() const
{
    return maxGain;
}

int FM::calcCutSize()
{
    int cnt = 0;
    for(const auto &net : Net::allNets)
        if(net.LSize > 0 && net.RSize > 0)
            cnt++;
    return cnt;
}

void FM::randomInit()
{
    totalLSize = totalRSize = 0;
    initNets();
    initNodes();
    initBucketList();
    Node::unlockAllNodes();
    // cout << "totalLSize = " << totalLSize << " totalRSize = " << totalRSize << endl; // for debug
}

void FM::pass()
{
    // cout << "=============PASS GO=============" << endl;
    int LGBMaxGain, RGBMaxGain; //  max gain in GainBucket

    backupNodeGain();

    maxGain = 0;
    bestStep = -1;
    for(stepCnt = 0; stepCnt < Node::numNodes; stepCnt++)
    {
        // GainBucket::showAllGainBuckets(); // for debug

        if(violateBalanceConstraint())
            balanceMoveStep();
        else
        {
            LGBMaxGain = LGainBucket.getMaxGain();
            RGBMaxGain = RGainBucket.getMaxGain();
            if(LGBMaxGain > RGBMaxGain)
                LtoR();
            else if(LGBMaxGain < RGBMaxGain)
                RtoL();
            else // LGBMaxGain == RGBMaxGain
                randomMoveStep();
        }

        // Node::showAllNodes(); // for debug
        // GainBucket::showAllGainBuckets(); // for debug

        recordStep();

        // cout << "cut size = " << calcCutSize() << " Gain = " << Gain << " maxGain = " << maxGain << endl; // for debug
        // cout << "LSize = " << totalLSize << " RSize = " << totalRSize << endl; // for debug
        // checkLRSize(); // for debug
    }

    reloadBestPartition();
    // cout << "after reload cut size = " << calcCutSize() << " Gain = " << Gain << " maxGain = " << maxGain << endl; // for debug
    // cout << "***********************************************************" << endl; // for debug
}

void FM::checkBalance()
{
    // for very small testcase, i.e., balanceBound < 2)

    // GainBucket::showAllGainBuckets(); // for debug
    if(abs(totalLSize - totalRSize) > balanceBound)
    {
        if(totalLSize > totalRSize)
        {
            Node *maxNode;
            int maxNodeGain = INT_MIN;
            for(auto &node : Node::allNodes)
            {
                if(node.onLeft() && node.gain > maxNodeGain)
                {
                    maxNode = &node;
                    maxNodeGain = node.gain;
                }
            }
            maxNode->toRight(LGainBucket, RGainBucket);
        }
        else // totalLSize < totalRSize
        {
            Node *maxNode;
            int maxNodeGain = INT_MIN;
            for(auto &node : Node::allNodes)
            {
                if(node.onRight() && node.gain > maxNodeGain)
                {
                    maxNode = &node;
                    maxNodeGain = node.gain;
                }
            }
            maxNode->toLeft(LGainBucket, RGainBucket);
        }
    }
}

// for debug
void FM::checkLRSize()
{
    int LSize = 0, RSize = 0;
    for(const auto &node : Node::allNodes)
    {
        if(node.onLeft())
            LSize++;
        else
            RSize++;
    }
    if(LSize != totalLSize || RSize != totalRSize)
        cout << "ERROR!    LSize = " << LSize << " RSize = " << RSize << endl;
}
