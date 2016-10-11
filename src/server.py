import pybel
from flask import Flask
from flask import render_template


app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello World!"

@app.route("/teste")
def teste():
    phenol = pybel.Smarts("[OH]c1ccccc1") # phenol
    ethyl = pybel.Smarts("[#6][#6]") # ethyl group
    # mol = pybel.readfile("mol2", "resources/base.mol2")
    atomtotal = 0
    for mol in pybel.readfile("mol2", "resources/base.mol2"):
        atomtotal += len(mol.atoms)
    return str(atomtotal)

if __name__ == "__main__":
    app.run()
