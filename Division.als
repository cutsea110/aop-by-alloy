module Division

sig A{
  R: set B
}

sig B{
}

sig C{
  S: set B,
  X: set A
}
/*
pred leftDiv {
  all b: B | some a: A, c: C | b in a.R implies b in c.S
}
*/
/*
pred leftDivRS [a: A, c: C]{
  all b: B | b in a.R implies b in c.S
}
*/
fun leftDivRS[] : A -> C {
  {a: A, c: C |  all b : B { b in a.R => b in c.S}}
}

pred show{
--  leftDivRS[] = A -> C
--  some leftDivRS[]
--  no leftDivRS[]
--  some (A -> C) - leftDivRS[]
--  some leftDivRS[] - (A -> C)
}

run show
