all: lab

parser.c parser.h: parser.y
	bison -y -d $< -o parser.c

lex.yy.c: lexer.l parser.h
	flex $<

lab: lex.yy.c parser.c parser.h
	cc $^ -o $@

clean:
	- rm lab parser.c parser.h lex.yy.c

.PHONY: all clean
