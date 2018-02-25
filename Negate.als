sig A {
}
sig B {
 R : set A,
 S : set A
}
pred imply (r, s : B -> A) {
 all a : A, b : B | b in r.a => b in s.a
}
pred show{
  imply[R,S]
--  !imply[S,R]
}

run show
