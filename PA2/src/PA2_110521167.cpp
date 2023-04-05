// Force-directed one layer & MUL first
#include "Parser.h"
#include "ForceDirected.h"

int main(int argc, char **argv)
{
    Parser ps(argc, argv);
    DAG *graph = ps.readInput();
    ForceDirected fd(graph);
    
    // fd.scheduling();
    fd.ASAP_ALAP();
    
    int assignTime;
    Node *minForceOp;
    while(fd.get_nOpNotAssigned() > 0)
    {
        tie(minForceOp, assignTime) = fd.selectOp();
        fd.assignOp(minForceOp, assignTime);
    }
    
    
    ps.outputResult(fd.opExeTime);

    delete graph;
    return EXIT_SUCCESS;
}