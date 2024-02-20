class Substr(gdb.Function):
  """
  Return substring of string:
  string $substr(string, start, length)
  (gdb) print $substr("Hello", 1, 4)
  (gdb) $1 = "ello"
"""

  def __init__(self):
    super(Substr, self).__init__("substr")

  def invoke (self, string, start, length):
    start = int(start)
    length = int(length)
    acc = ""
    i = 0
    while i < length:
      acc += chr(string[start + i])
      i += 1
    return acc

Substr()
