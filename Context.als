module Context
-- section 7.1
-- minR ・ ΛS = min(R ∩ (S ・ S゜)) ・ ΛS

sig A {
  R : set A
}

sig B {
  S : set A
}

pred context {
  some R & ~S.S
}

fun LambdaS[] : B -> set A {
  S & B -> B.S
}

run context

