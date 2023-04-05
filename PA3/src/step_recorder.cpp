#include "step_recorder.h"
#include <cmath> // for abs()

StepRecorder::StepRecorder(int numNodes)
{
    Gain = 0;
    stepList.assign(numNodes, nullptr);
    gainBackup.assign(numNodes, 0);
}

void StepRecorder::backupNodeGain()
{
    for(int i = 0; i < Node::numNodes; i++)
        gainBackup[i] = Node::allNodes[i].gain;
}

void StepRecorder::reloadNodeGain()
{
    for(int i = 0; i < Node::numNodes; i++)
        Node::allNodes[i].gain = gainBackup[i];
}

void StepRecorder::recordStep()
{
    stepList[stepCnt] = moveNode;
    Gain += moveNode->gain;
    if(Gain > maxGain || Gain == maxGain && abs(totalLSize - totalRSize) < unbalanceNum)
    {
        bestStep = stepCnt;
        maxGain = Gain;
        unbalanceNum = abs(totalLSize - totalRSize);
    }
}
