(*
  Execute the generated code. Binding the result to () rather than _ makes
  the compiler check that running the code really yields unit, instead of
  silently discarding whatever it returns.
*)
let () = Runcode.run Merry_fxmas.action_code
