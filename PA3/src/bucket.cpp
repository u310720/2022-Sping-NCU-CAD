// bucket.cpp
#include "bucket.h"

// class Bucket implementation
// Bucket public
bool Bucket::empty() const
{
    return size == 0;
}

void Bucket::clear()
{
    size = 0;
    for(Node *cur = head; head != nullptr; cur = head)
    {
        head = cur->RLink;
        cur->LLink = cur->RLink = nullptr;
    }
}

void Bucket::insert(Node *n)
{
    size++;
    if(head)
    {
        head->LLink = n;
        n->RLink = head;
        n->LLink = nullptr;
        head = n;
    }
    else
    {
        n->LLink = nullptr;
        n->RLink = nullptr;
        head = n;
    }
}

void Bucket::remove(Node *n)
{
    size--;
    if(n == head)
    {
        head = n->RLink;
        if(head)
            head->LLink = nullptr;
        n->RLink = nullptr;
    }
    else
    {
        n->LLink->RLink = n->RLink;
        if(n->RLink)
        {
            n->RLink->LLink = n->LLink;
            n->RLink = nullptr;
        }
        n->LLink = nullptr;
    }
}

// Bucket overloading
Node *Bucket::operator[](int idx)
{
    if(idx >= size || idx < 0)
        return nullptr;
    else
    {
        Node *node = head;
        for(int i = 0; i < idx; i++)
            node = node->RLink;
        return node;
    }
}

// class GainBucket implementation
int GainBucket::PMax = 0;

// GainBucket public
GainBucket::GainBucket()
{
    allGainBuckets.push_back(this);
}

int GainBucket::getPMax()
{
    return PMax;
}

void GainBucket::setPMax(int _PMax)
{
    PMax = _PMax;
}

bool GainBucket::empty() const
{
    return maxGainIdx == -1;
}

void GainBucket::clear()
{
    maxGainIdx = -1;
    for(auto &bucket : bucketList)
        bucket.clear();
}
#include <iostream>
void GainBucket::insert(Node *node)
{
    /*if(this == allGainBuckets[0]) // for debug
        std::cout << "A";
    else
        std::cout << "B";
    std::cout << " insert " << node->name << " idx = " << node->gain + PMax << " maxGainIdx = " << maxGainIdx << "\n";*/
    static int idx;
    idx = node->gain + PMax;
    maxGainIdx = maxGainIdx < idx ? idx : maxGainIdx;
    bucketList[idx].insert(node);
    // showAllGainBuckets(); // for debug
}

void GainBucket::remove(Node *node)
{
    /*if(this == allGainBuckets[0]) // for debug
        std::cout << "A";
    else
        std::cout << "B";
    std::cout << " remove " << node->name << " idx = " << node->gain + PMax << " maxGainIdx = " << maxGainIdx << "\n";*/
    static int idx;
    idx = node->gain + PMax;
    bucketList[idx].remove(node);
    while(bucketList[maxGainIdx].empty() && maxGainIdx != -1) // if maxGainIdx == -1 then GainBucket is empty
        maxGainIdx--;
    // showAllGainBuckets(); // for debug
}

Node *GainBucket::getMaxGainNode()
{
    // random select is useless
    /*Bucket &bucket = bucketList[maxGainIdx];
    return bucket[bucket.size > 3 ? rand() % 3 : rand() % bucket.size];*/

    return bucketList[maxGainIdx].head;
}

int GainBucket::getMaxGain() const
{
    return maxGainIdx - PMax;
}

// GainBucket overloading
Bucket &GainBucket::operator[](int nodeGain)
{
    return bucketList[nodeGain + PMax];
}

// debug
#include <iostream>
#include <iomanip>
using namespace std;

void Bucket::showBucket()
{
    Node *node = head;
    for(;node != nullptr; node = node->RLink)
        cout << node->name << " ";
    cout << endl;
}

vector<GainBucket *> GainBucket::allGainBuckets; // for debug
void GainBucket::showAllGainBuckets()
{
    int i = 0, j, A = (int)('A');
    for(const auto &GB : allGainBuckets)
    {
        j = 0;
        cout << "GainBucket " << (char)(A + i++) << endl;
        for(auto &bucket : GB->bucketList)
        {
            cout << " " << right << setw(4) << j++ - PMax << " --> ";
            bucket.showBucket();
        }
    }
    cout << endl;
}
