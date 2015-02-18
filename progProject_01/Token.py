from enum import Enum, unique


@unique
class TokenCode(Enum):
    ID = 1
    ASSIGN = 2
    SEMICOL = 3
    INT = 4
    PLUS = 5
    MINUS = 6
    MULT = 7
    LPAREN = 8
    RPAREN = 9
    PRINT = 10
    END = 11
    ERROR = 12


class Token:
    def __init__(self, lexeme, token_code):
        self.tCode = token_code
        self.lexeme = lexeme

    def __str__(self):
        return self.lexeme + " " + self.tCode
