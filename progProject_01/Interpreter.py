import sys


class Interpreter:
    def __init__(self):
        self.vars = {}
        self.stack = []

    def run(self):
        for line in sys.stdin:
            command, sep, op = line.partition(' ')
            if command is 'PUSH':
                self.push()

    def push(self, op):
        try:
            self.stack.append(int(op))
        except Exception:
            print('Error')

if __name__ == '__main__':
    interpreter = Interpreter()
    interpreter.run()
