from Token import Token, TokenCode
import sys
import re


class Lexer:
    def __init__(self):
        self.splitter = re.compile(r'(\s+|[;])')
        self.get_next_line()

    def get_next_line(self):
        self.buffer = self.splitter.split(sys.stdin.readline())
        self.next_id = 0

    def next_token(self):
        if len(self.buffer) == self.next_id:
            self.get_next_line()

        s = self.buffer[self.next_id]

        return Token("error", TokenCode.ERROR)
