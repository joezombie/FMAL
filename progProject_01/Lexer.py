from Token import Token, TokenCode
import sys
import re


class Lexer:
    def __init__(self):
        self.splitter = re.compile(r'(\s+|[;]|[-]|[+]|[*]|[(]|[)]|[=])')
        self.id = re.compile(r'\D+')
        self.int = re.compile(r'\d+')
        self.lexemes = []
        self.read_stdin()

    def read_stdin(self):
        for line in sys.stdin:
            split = self.splitter.split(line)
            for s in split:
                if s != ' ' and s != '\n' and len(s) > 0:
                    self.lexemes.append(s)
        self.next_id = 0

    def string_to_token_code(self, s):
        return {
            '=': TokenCode.ASSIGN,
            ';': TokenCode.SEMICOL,
            '+': TokenCode.PLUS,
            '-': TokenCode.MINUS,
            '*': TokenCode.MULT,
            '(': TokenCode.LPAREN,
            ')': TokenCode.RPAREN,
            'print': TokenCode.PRINT,
            'end': TokenCode.END
        }.get(s, TokenCode.ERROR)

    def next_token(self):
        if self.next_id == len(self.lexemes):
            return Token('', TokenCode.ERROR)

        l = self.lexemes[self.next_id]
        self.next_id += 1

        token_code = self.string_to_token_code(l)

        if token_code is TokenCode.ERROR:
            if self.id.match(l):
                token_code = TokenCode.ID
            elif self.int.match(l):
                token_code = TokenCode.INT

        return Token(l, token_code)
