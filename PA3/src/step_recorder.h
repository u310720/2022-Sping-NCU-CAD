#ifndef __STEPRECORDER_H_
#define __STEPRECORDER_H_

#include "node.h"
#include <vector>

class StepRecorder
{
protected:
    Node *moveNode;
    int Gain, // current Gain, Gain = gain(1) + gain(2) + ... + gain(numNodes)
        maxGain, // maximum of Gain
        bestStep, //  the index of stepList where the maximum of Gain occurs
        stepCnt, // step counter
        totalLSize, totalRSize, unbalanceNum; // # of nodes on left, # of nodes on right, difference between totalLSize & totalRSize
    std::vector<Node *> stepList;
    std::vector<int> gainBackup;

    StepRecorder(int);

    void backupNodeGain();
    void reloadNodeGain();
    void recordStep();
};

#endif // __STEPRECORDER_H_

