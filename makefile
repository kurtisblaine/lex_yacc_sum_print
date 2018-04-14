run: lex.yy.c sum.tab.c 
	gcc sum.tab.c lex.yy.c -lfl -ly -o run 

lex.yy.c: sum.l
	flex sum.l

sum.tab.c: sum.y
	bison -dv sum.y

clean:
	rm -f lex.yy.c 
	rm -f sum.output
	rm -f sum.tab.h
	rm -f sum.tab.c


