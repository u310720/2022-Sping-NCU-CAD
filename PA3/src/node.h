#ifndef __NODE_H_
#define __NODE_H_

#include<string>
#include<vector>
#include "net.h"
#include "bucket.h"
using std::string;
using std::vector;

class Net;
class GainBucket;
class FM;

class Node
{
private:
    string name;
    Node *LLink, *RLink;

    int gain;
    bool side, locked;
    vector<Net *> nets; // connected nets

    friend class Net;
    friend class Bucket;
    friend class GainBucket;
    friend class StepRecorder;
    friend class FM;
    friend void read(const string &file);
    friend void write(const string &file, int cutSize, const vector<bool> &bestPartition);

public:
    enum SIDE
    {
        LEFT,
        RIGHT
    };

    static int numNodes;
    static vector<Node> allNodes;
    static void unlockAllNodes();
    static int calcMaxDegree();

    bool operator<(const Node &) const;
    static void sort(vector<Node *>::iterator, vector<Node *>::iterator);

    Node(const string &);

    bool getSide() const;
    void setSide(bool);

    bool isFree() const;
    void lock();
    void unlock();
    bool onLeft() const;
    bool onRight() const;

    void calcGain();

    void toLeft(GainBucket &LGainBucket, GainBucket &RGainBucket);
    void toRight(GainBucket &LGainBucket, GainBucket &RGainBucket);

    static void showAllNodes(); // for debug
};

#endif // __NODE_H_

