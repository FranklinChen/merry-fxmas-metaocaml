let rec repeat_message_staged n =
  if n > 0 then
    let s = "Merry Christmas Bill " ^ string_of_int n ^ "!" in
    .<
      begin
        print_endline s;
        .~(repeat_message_staged (n-1))
      end
    >.
  else
    .< () >.

(*
  The code generated at runtime is essentially a sequence of
  compiled instructions that amount to

  begin
    print_endline "Merry Christmas Bill 25!";
    print_endline "Merry Christmas Bill 24!";
    // ...
    print_endline "Merry Christmas Bill 1!";
    ()
  end
*)
let action_code = repeat_message_staged 25

(*
  Execute the code.
*)
let _ = Runcode.run action_code
