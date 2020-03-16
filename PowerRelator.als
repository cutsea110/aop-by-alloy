module PowerRelator

sig A {
  R : set B
}

sig B {
}

pred P {
  all a : A | some b : B | b in a.R
  all b : B | some a : A | a in R.b
}

run P
