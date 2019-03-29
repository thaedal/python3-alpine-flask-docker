#!/usr/bin/env python3

import os
from flask import Flask
app = Flask(__name__)


@app.route('/')
def hello():
    return 'Hello flask from alpine linux'


def main():
    port = int(os.environ.get('PORT', 5000))
    app.run(host='0.0.0.0', port=port)


if __name__ == '__main__':
    main()
