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

run context

