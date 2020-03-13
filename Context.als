module Context

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

