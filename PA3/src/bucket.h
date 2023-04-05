#ifndef __BUCKET_H_
#define __BUCKET_H_

#include "node.h"
#include <vector>

class Node;

class Bucket
{
private:
    int size = 0;
    Node *head = nullptr;

    friend class GainBucket;

public:
    bool empty() const;
    void clear();
    void insert(Node *);
    void remove(Node *);

    Node *operator[](int);

    void showBucket(); // for debug
};

class GainBucket
{
private:
    static std::vector<GainBucket *> allGainBuckets; // for debug
    static int PMax; // maximum degree of all nodes
    int maxGainIdx = -1;


public:
    GainBucket(); // for debug
    std::vector<Bucket> bucketList;

    static int getPMax();
    static void setPMax(int);

    bool empty() const;
    void clear();
    void insert(Node *);
    void remove(Node *);
    Node *getMaxGainNode();
    int getMaxGain() const;

    Bucket &operator[](int gain);

    static void showAllGainBuckets();
};

#endif // __BUCKET_H_

