import os

class Env(gdb.Function):
  """
  Return value of environment variable
  (gdb) print $env("USER")
"""

  def __init__(self):
    super(Env, self).__init__("env")

  def invoke (self, name):
    return os.environ[name.string()]

Env()
