from Token import TokenCode


class Parser:
    def __init__(self, lexer):
        self.lexer = lexer

    def parse(self):
        self.get_next_token()
        while True:
            if self.token.tCode is TokenCode.END:
                break
            elif self.token.tCode is TokenCode.ERROR:
                self.error()
            self.statement()
            if self.token.tCode is TokenCode.SEMICOL:
                self.get_next_token()
            else:
                self.error()

    def get_next_token(self):
        self.token = self.lexer.next_token()
        # print(str(self.token))

    def statement(self):
        if self.token.tCode is TokenCode.ID:
            print('PUSH {}'.format(self.token.lexeme))
            self.get_next_token()
            if self.token.tCode is TokenCode.ASSIGN:
                self.get_next_token()
                self.expr()
                print('ASSIGN')
            else:
                self.error()
        elif self.token.tCode is TokenCode.PRINT:
            self.get_next_token()
            if self.token.tCode is TokenCode.ID:
                print('PUSH {}'.format(self.token.lexeme))
                self.get_next_token()
            else:
                self.error()
            print('PRINT')
        else:
            self.error()

    def expr(self):
        self.term()

        if self.token.tCode is TokenCode.PLUS:
            self.get_next_token()
            self.expr()
            print('ADD')
        elif self.token.tCode is TokenCode.MINUS:
            self.get_next_token()
            self.expr()
            print('SUB')

    def term(self):
        self.factor()
        if self.token.tCode is TokenCode.MULT:
            self.get_next_token()
            self.term()
            print('MULT')

    def factor(self):
        if self.token.tCode is TokenCode.ID:
            print('PUSH {}'.format(self.token.lexeme))
            self.get_next_token()
        elif self.token.tCode == TokenCode.INT:
            print('PUSH {}'.format(self.token.lexeme))
            self.get_next_token()
        elif self.token.tCode is TokenCode.LPAREN:
            self.get_next_token()
            self.expr()
            if self.token.tCode is TokenCode.RPAREN:
                self.get_next_token()
            else:
                self.error()
        else:
            self.error()

    def error(self):
        print('Syntax error!')
        exit(-1)
