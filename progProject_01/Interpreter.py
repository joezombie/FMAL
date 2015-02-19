import sys


class Interpreter:
    def __init__(self):
        print('Interpreter')

    def run(self):
        for line in sys.stdin:
            command, op = line.split()

if __name__ == '__main__':
    interpreter = Interpreter()
    interpreter.run()
