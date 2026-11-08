(*
  A rough, wall-clock comparison of a plain recursive power against its
  staged sibling. It is not meant to be publication-grade: byte code, a
  tiny exponent and no warm-up. Its purpose is only to make the
  specialization that appears in `print_code.expected` measurable.
*)

let plain n x =
  let rec loop acc i =
    if i <= 0 then acc else loop (acc * x) (i - 1)
  in
  loop 1 n

let () =
  let n = 8 in
  let iters = 100_000 in
  let start_plain = Unix.gettimeofday () in
  let plain_sum = ref 0 in
  for _ = 1 to iters do
    plain_sum := !plain_sum + plain n 2
  done;
  let t_plain = Unix.gettimeofday () -. start_plain in
  let f = Runcode.run (Power_staged.power_fun n) in
  (* Force compilation of the staged body before timing, so the measured
     loop reflects running it rather than generating it. *)
  ignore (f 2);
  let start_staged = Unix.gettimeofday () in
  let staged_sum = ref 0 in
  for _ = 1 to iters do
    staged_sum := !staged_sum + f 2
  done;
  let t_staged = Unix.gettimeofday () -. start_staged in
  if !plain_sum <> !staged_sum then
    failwith "benchmark disagreement: staged and plain results differ";
  Printf.printf "plain:   %8.4f s  (%d iterations, result %d)\n"
    t_plain iters !plain_sum;
  Printf.printf "staged:  %8.4f s  (%d iterations, result %d)\n"
    t_staged iters !staged_sum;
  Printf.printf "speedup: %6.2f\n" (t_plain /. t_staged)
