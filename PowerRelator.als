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

-- Power Relator rule
-- Alloy における 1インスタンスを冪集合の1対象とみなす
-- つまり Next で表示される関係図のAの集まりやBの集まりがそれぞれ PA , PB の対象にあたる
-- すると
--     ∈
-- A <- PA
--  |R     | PR
--  v      v
-- B <- PB
--     ∈
-- において R ・ ∈ ⊆ ∈・PR である条件が PowerRule になっている
check PowerRule {
  all a : A | a.R in B
}

run {
  P
}
