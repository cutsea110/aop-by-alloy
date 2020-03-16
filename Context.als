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

fun Lambda[b : B] : B -> set A {
  b -> b.S
}

-- 最小
fun minR[xs : A] : A {
  min[R, xs]
}

fun min[r : A -> A, xs : A] : A {
  { a : A | a in xs and all b : A - a { b in xs => a in b.r }}
}

fun minbound[r : A -> A, xs : A] : A {
  { a : A | a in xs and no (r-iden).a }
}


-- 反射的
pred reflexiveR {
  (iden & (A -> A)) in R
}

-- 推移的
pred transitiveR {
  R.R in R
}

-- 前順序
pred preorderR {
  reflexiveR and transitiveR
}

-- 複数の最小元がある
pred multiMin {
  some disj x, x' : A { no (x.*R & x'.*R) and no (R - iden).x and no (R - iden).x' }
}

-- FIXME!
check {
  context and preorderR and multiMin => minbound[R,A] = minbound[R & ~S.S, A]
}

run { context and preorderR and multiMin } for 6
