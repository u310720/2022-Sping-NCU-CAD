#ifndef __FM_H_
#define __FM_H_

#include "net.h"
#include "node.h"
#include "bucket.h"
#include "step_recorder.h"

class Node;
class Net;
class GainBucket;
class StepRecorder;

class FM : public StepRecorder // StepRecorder: record move steps in a pass and when the maxGain occurs
{
private:
    const float balanceBound; // partition balance constraint
    GainBucket LGainBucket, RGainBucket;

    bool violateBalanceConstraint();

    void randomPartition(Node &node);
    void initNets();
    void initNodes();
    void initBucketList();

    void RtoL();
    void LtoR();
    void randomMoveStep();
    void balanceMoveStep();

    void reloadFoward();
    void reloadBackward();
    void reloadBestPartition();

    void checkLRSize(); // for debug
    void checkCutSize(); // for debug

public:
    FM(double unbalanced_ratio);
    int get_maxGain() const;
    int calcCutSize();
    void randomInit();
    void pass();
    void checkBalance();
};

#endif // __FM_H_

