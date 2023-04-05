# PA3 cpp compiler
.PHONY: all run clean

G = g++ -std=c++11 -O3 -c

all: node.o net.o bucket.o step_recorder.o fm.o 110521167_PA3.o
	g++ -std=c++11 $^ -o PA3

node.o: node.cpp node.h
	$(G) $<

net.o: net.cpp net.h
	$(G) $<

bucket.o: bucket.cpp bucket.h
	$(G) $<

step_recorder.o: step_recorder.cpp step_recorder.h
	$(G) $<

fm.o: fm.cpp fm.h
	$(G) $<

110521167_PA3.o: 110521167_PA3.cpp node.h net.h bucket.h fm.h
	$(G) $<

run:
	./PA3 $(INPUT) $(OUTPUT)

clean:
	@rm *.gch *.o *.out PA3
