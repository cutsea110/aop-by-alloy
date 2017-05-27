module RightDivision

sig A{
}

sig B{
}

sig C{
  S: set A,
  R: set B
}

fun rightDivSR[] : B -> A {
  {b: B, a: A |  all c : C { c in b.~R => c in a.~S}}
}
pred show{
  some rightDivSR[]
}

run show
