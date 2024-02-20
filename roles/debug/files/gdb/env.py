import os

class Env(gdb.Function):
  """
  Return value of environment variable:
  string $env(string)
  (gdb) print $env("USER")
  (gdb) $1 = ten0s
"""

  def __init__(self):
    super(Env, self).__init__("env")

  def invoke (self, name):
    return os.environ[name.string()]

Env()
