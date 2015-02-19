class TokenCode:
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

    def __str__(self):
        return str(self.name)


class Token:
    def __init__(self, lexeme, token_code):
        self.tCode = token_code
        self.lexeme = lexeme

    def __str__(self):
        return 'Lexeme:{0} TokenCode:{1}'.format(self.lexeme, self.tCode)
