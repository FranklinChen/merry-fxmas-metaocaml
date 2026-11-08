(*
  A second staging exercise: compiler *specialization*.  Given a fixed
  exponent [n], [power_fun n] builds code for a function that computes
  [x ** n] by repeated multiplication, with the recursion, the tests and
  the counter all resolved in stage 1.  Stage 2 is just multiplications
  (and, when [n] is zero, just the constant [1]).

  This is the example that shows why staging earns its keep: a staged
  power function can be as fast as hand-unrolled code while remaining a
  perfectly ordinary recursive OCaml function in the source.
*)

let rec power n x =
  if n <= 0 then
    .< 1 >.
  else
    .< .~x * .~(power (n - 1) x) >.

let power_fun n =
  .< fun x -> .~(power n .<x>.) >.
