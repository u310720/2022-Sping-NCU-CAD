#PA2 cpp compiler
.PHONY: all run clean
all: PA2_110521167.o Parser.o ForceDirected.o
	@g++ -O3 -std=c++11 PA2_110521167.o Parser.o ForceDirected.o -o exe 
run:
	@./exe $(input) $(output)
clean:
	@rm *.o *.gch *.out rm exe

PA2_110521167.o: PA2_110521167.cpp Parser.h ForceDirected.h
	@g++ -O3 -std=c++11 -c PA2_110521167.cpp DS.h
Parser.o: Parser.cpp Parser.h
	@g++ -O3 -std=c++11 -c Parser.cpp Parser.h
ForceDirected.o: ForceDirected.cpp ForceDirected.h
	@g++ -O3 -std=c++11 -c ForceDirected.cpp ForceDirected.h

