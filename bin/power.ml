let code = Power_staged.power_fun 5
let f = Runcode.run code

let () =
  Format.printf "%a@." Codelib.print_code code;
  print_endline (string_of_int (f 2))
