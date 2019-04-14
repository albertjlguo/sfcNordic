import os
from setuptools import setup

def read(fname):
    return open(os.path.join(os.path.dirname(__file__), fname)).read()

if __name__ == "__main__":
    setup(name="Nordic-Test-System",
          version = "0.0.3",
          author = "Jialeng Guo",
          author_email = "el17jg@leeds.ac.uk",
          description = ("Python code to load, simulate"),
          license = "GPLv3",
          keywords = "Centralized control algorithms for Nordic Smart Grid operation.",
          url = "https://github.com/realgjl/Nordic-Test-System",
          packages = ["examples", "analysis"],
          long_description=read('README.md')
    )
