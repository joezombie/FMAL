from Lexer import Lexer
from Parser import Parser


myLexer = Lexer()
myParser = Parser(myLexer)

print(myLexer.next_token())
