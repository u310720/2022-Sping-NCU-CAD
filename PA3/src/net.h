#ifndef __NET_H_
#define __NET_H_

#include<string>
#include <vector>
#include "node.h"
using std::string;
using std::vector;

class Node;
class Net
{
private:
    string name;
    int LSize, RSize;
    vector<Node *> nodes; // connected nodes

    friend class Node;
    friend class FM;
    friend void read(const string &file);

    void calcLRSize();
public:
    // bool updatable; // FUTURE WORK: if all nodes on this net are locked, then this is updatable, maybe can make program run faster
    static vector<Net> allNets;
    int calcGain(Node *node);

    static void showAllNets(); // for debug
};

#endif // __NET_H_
