let () =
  assert (Runcode.run (Power_staged.power_fun 0) 2 = 1);
  assert (Runcode.run (Power_staged.power_fun 5) 2 = 32);
  assert (Runcode.run (Power_staged.power_fun 7) 9 = 4782969);
  print_endline "ok"
