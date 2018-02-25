sig A {
}
sig B {
 R : set A,
 S : set A
}
-- R => S
pred imply (r, s : B -> A) {
 all a : A, b : B | b in r.a => b in s.a
}
-- R => 0
pred negate (r, s : B -> A) {
 all a : A, b : B | b in r.a => b in s.a and no s.a
}
pred show{
  negate[R,S]
--  imply[R,S]
--  !imply[S,R]
}

run show
