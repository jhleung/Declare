import Prelude hiding (LT, GT, EQ, id)
import Declare
import DeclareParse
import Base

t1 = "4"
t2 = "-4 - 6"
t3 = "var x = 3; x"
t4 = "var x = 3; var y = x*x; x"
t5 = "var x = 3; var x = x*x; x"

t6 = "var x = 3; var y = x*x; y"
t7 = "2 + (var x =2; x)"

-- my test cases
t8 = "var x = 3, y = 9; x*y"
t9 = "var a = 2, b = 7; (var m = 5 * a, n = b - 1; a * n + b / m) + a"
t10 = "var a = 2, b = 7; (var m = 5 * a, n = m - 1; a * n + b / m) + a"
t11 = "var a = 3; var b = 8; var a = b, b = a; a + b"
t12 = "var a = 3; var b = 8; var a = b; var b = a; a + b"
t13 = "var x = 3; var x = x + 2; x*2"

t15 = "var x = 3; (var y = 3*x; 2+y) + (var z = 7*x; 1+z)"
t16 = "var x = 1, y = 2, z = 3; x+y+z"
-- should throw error
t14 = "var x = 3, x = x + 2; x*2" 

test1 = do
  test "execute" execute (parseExp t1)
  test "execute" execute (parseExp t2)
  test "execute" execute (parseExp t3)
  test "execute" execute (parseExp t4)
  test "execute" execute (parseExp t5)
  test "execute" execute (parseExp t6)
  test "execute" execute (parseExp t7)
  test "execute" execute (parseExp t8)
  test "execute" execute (parseExp t9)
  test "execute" execute (parseExp t10)
  test "execute" execute (parseExp t11)
  test "execute" execute (parseExp t12)
  test "execute" execute (parseExp t13)
  test "execute" execute (parseExp t14)
  test "execute" execute (parseExp t15)
  test "execute" execute (parseExp t16)

main = do
  tagged "DeclTest1" test1
  
  
