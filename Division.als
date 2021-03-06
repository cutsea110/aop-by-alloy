module Division

sig A{
  R: set B
}

sig B{
}

sig C{
  S: set B
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
fun leftDivRS[] : C -> A {
  {c: C, a: A |  all b : B { b in a.R => b in c.S}}
}
-- {c: C | all b : B { b in c.S}}
-- {a: A| all b: B { b in a.R}}

assert inS {
  leftDivRS.R in S
}

check inS for 10

pred show{
-- leftDivRS[] = C -> A
  some leftDivRS[]
--  no leftDivRS[]
--  some (C -> A) - leftDivRS[]
--  some leftDivRS[] - (C -> A)
-- 半可換?
-- some S - leftDivRS.R
-- 可換?
-- no S - leftDivRS.R
}

run show
