// node.cpp
#include "node.h"
#include <algorithm> // for sort()

int Node::numNodes = 0;
vector<Node> Node::allNodes;

// public
Node::Node(const string & _name)
{
    name = _name;
    numNodes++;
}

bool Node::getSide() const
{
    return side;
}

void Node::setSide(bool _side)
{
    side = _side;
}

bool Node::isFree() const
{
    return !locked;
}

void Node::lock()
{
    locked = true;
}

void Node::unlock()
{
    locked = false;
}

bool Node::onLeft() const
{
    return side == LEFT;
}

bool Node::onRight() const
{
    return side == RIGHT;
}

int Node::calcMaxDegree()
{
    int maxDegree = 0, degree;
    for(const auto &n : allNodes)
    {
        degree = n.nets.size();
        maxDegree = maxDegree < degree ? degree : maxDegree;
    }
    return maxDegree;
}

void Node::unlockAllNodes()
{
    for(auto &node : allNodes)
        node.locked = false;
}

void Node::calcGain()
{
    gain = 0;
    for(const auto &net : nets)
        gain += net->calcGain(this);
}

void Node::toLeft(GainBucket &LGainBucket, GainBucket &RGainBucket) // move node from right to left
{
    side = LEFT;
    locked = true;
    RGainBucket.remove(this);

    for(auto &net : nets)
    {
        switch(net->LSize++) // increment T(n)
        {
        case 0:
        {
            int effect = (--net->RSize == 1) ? 2 : 1; // decrement F(n) and calculate gain effect
            for(auto &node : net->nodes)
            {
                if(node->isFree()) // free nodes are on the right
                {
                    RGainBucket.remove(node);
                    node->gain += effect;
                    RGainBucket.insert(node);
                }
            }
            break;
        }
        case 1:
            switch(--net->RSize) // decrement F(n), this part was originally the lower half of the pseudo code in the paper
            {
            case 0:
                for(auto &node : net->nodes)
                {
                    if(node->isFree()) // free nodes are on the left
                    {
                        LGainBucket.remove(node);
                        node->gain -= 2;
                        LGainBucket.insert(node);
                    }
                }
                break;
            case 1:
                for(auto &node : net->nodes)
                {
                    if(node->isFree())
                    {
                        if(node->onLeft())
                        {
                            LGainBucket.remove(node);
                            node->gain--;
                            LGainBucket.insert(node);
                        }
                        else
                        {
                            RGainBucket.remove(node);
                            node->gain++;
                            RGainBucket.insert(node);
                        }
                    }
                }
                break;
            default:
                for(auto &node : net->nodes)
                {
                    if(node->isFree() && node->onLeft())
                    {
                        LGainBucket.remove(node);
                        node->gain--;
                        LGainBucket.insert(node);
                    }
                }
                break;
            }
            break;
        default:
            switch(--net->RSize) // decrement F(n), this part was originally the lower half of the pseudo code in the paper
            {
            case 0:
                for(auto &node : net->nodes)
                {
                    if(node->isFree()) // free nodes are on the left
                    {
                        LGainBucket.remove(node);
                        node->gain--;
                        LGainBucket.insert(node);
                    }
                }
                break;
            case 1:
                for(auto &node : net->nodes)
                {
                    if(node->isFree() && node->onRight())
                    {
                        RGainBucket.remove(node);
                        node->gain++;
                        RGainBucket.insert(node);
                    }
                }
                break;
            default:
                break;
            }
            break;
        }
    }
}

void Node::toRight(GainBucket &LGainBucket, GainBucket &RGainBucket) // move node from left to right
{
    side = RIGHT;
    locked = true;
    LGainBucket.remove(this);

    for(auto &net : nets)
    {
        switch(net->RSize++) // increment T(n)
        {
        case 0:
        {
            int effect = (--net->LSize == 1) ? 2 : 1; // decrement F(n) and calculate gain effect
            for(auto &node : net->nodes)
            {
                if(node->isFree()) // free nodes are on the left
                {
                    LGainBucket.remove(node);
                    node->gain += effect;
                    LGainBucket.insert(node);
                }
            }
            break;
        }
        case 1:
            switch(--net->LSize) // decrement F(n), this part was originally the lower half of the pseudo code in the paper
            {
            case 0:
                for(auto &node : net->nodes)
                {
                    if(node->isFree()) // free nodes are on the right
                    {
                        RGainBucket.remove(node);
                        node->gain -= 2;
                        RGainBucket.insert(node);
                    }
                }
                break;
            case 1:
                for(auto &node : net->nodes)
                {
                    if(node->isFree())
                    {
                        if(node->onRight())
                        {
                            RGainBucket.remove(node);
                            node->gain--;
                            RGainBucket.insert(node);
                        }
                        else
                        {
                            LGainBucket.remove(node);
                            node->gain++;
                            LGainBucket.insert(node);
                        }
                    }
                }
                break;
            default:
                for(auto &node : net->nodes)
                {
                    if(node->isFree() && node->onRight())
                    {
                        RGainBucket.remove(node);
                        node->gain--;
                        RGainBucket.insert(node);
                    }
                }
                break;
            }
            break;
        default:
            switch(--net->LSize) // decrement F(n), this part was originally the lower half of the pseudo code in the paper
            {
            case 0:
                for(auto &node : net->nodes)
                {
                    if(node->isFree()) // free nodes are on the right
                    {
                        RGainBucket.remove(node);
                        node->gain--;
                        RGainBucket.insert(node);
                    }
                }
                break;
            case 1:
                for(auto &node : net->nodes)
                {
                    if(node->isFree() && node->onLeft())
                    {
                        LGainBucket.remove(node);
                        node->gain++;
                        LGainBucket.insert(node);
                    }
                }
                break;
            default:
                break;
            }
            break;
        }
    }
}

// overloading
bool Node::operator<(const Node &node) const
{
    string name1, name2;
    name1.reserve(10);
    name2.reserve(10);
    for(const auto &c : name)
        if(isdigit(c))
            name1.push_back(c);
    for(const auto &c : node.name)
        if(isdigit(c))
            name2.push_back(c);
    return stoi(name1) < stoi(name2);
}

void Node::sort(vector<Node *>::iterator begin, vector<Node *>::iterator end)
{
    static auto lessCmp = [](const Node *n1, const Node *n2)
    {
        return *n1 < *n2;
    };
    std::stable_sort(begin, end, lessCmp);
}

// for debug
#include <iostream>
void Node::showAllNodes()
{
    // sort( vecotr<Node> ...) might change nodes address, which would invalidte pointers from net to node
    vector<Node *> allNodesPtr(Node::numNodes, nullptr);
    for(int i = 0; i < Node::numNodes; i++)
        allNodesPtr[i] = &Node::allNodes[i];

    sort(allNodesPtr.begin(), allNodesPtr.end());
    for(const auto &node : allNodesPtr)
        std::cout << node->name << (node->onLeft() ? " LEFT" : " RIGHT") << " " << node->gain << std::endl;
}
