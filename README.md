**`Jupyter Lab` server that supports both `Python` and `Node.js` backends.**

This can be used as a useful example of how to configure such an environment when you need to have JS and Python code cells in one Jupyter notebook.

### Run

    docker-compose up

or

    docker-compose up -d

### Add new library

    poetry add <library-name>
    docker-compose build
