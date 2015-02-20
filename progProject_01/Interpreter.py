import sys


class Interpreter:
    def __init__(self):
        self.vars = {}
        self.stack = []

    def run(self):
        for line in sys.stdin:
            command, sep, op = line.rstrip('\n').partition(' ')

            if command == 'PUSH':
                self.push(op)
            elif command == 'ADD':
                self.add()
            elif command == 'SUB':
                self.sub()
            elif command == 'MULT':
                self.mult()
            elif command == 'ASSIGN':
                self.assign()
            elif command == 'PRINT':
                self.print_out()
            else:
                self.error()

    def push(self, op):
        self.stack.append(op)

    def get_int(self):
        op = self.stack.pop()
        try:
            val = int(op)
        except ValueError:
            try:
                val = self.vars[op]
            except Exception:
                self.error()
        return val

    def add(self):
        b = self.get_int()
        a = self.get_int()
        self.stack.append(a + b)

    def sub(self):
        b = self.get_int()
        a = self.get_int()
        self.stack.append(a - b)

    def mult(self):
        b = self.get_int()
        a = self.get_int()
        self.stack.append(a * b)

    def assign(self):
        try:
            val = self.get_int()
        except ValueError:
            self.error()
        else:
            self.vars[self.stack.pop()] = val

    def print_out(self):
        print(self.get_int())
        pass

    def error(self):
        print('Error')
        exit(-1)

if __name__ == '__main__':
    interpreter = Interpreter()
    interpreter.run()
