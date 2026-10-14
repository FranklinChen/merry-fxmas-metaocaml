(** Staged generation of a countdown of Christmas greetings. *)

(** [repeat_message_staged n] builds, without printing anything, code that
    prints ["Merry Christmas Bill k!"] for each [k] from [n] down to [1] as a
    flat sequence of [print_endline] calls; the recursion over [n] happens
    entirely at generation time. For [n <= 0] the code does nothing. *)
val repeat_message_staged : int -> unit Codelib.code

(** The 25-greeting countdown that the [merry-fxmas] executable runs. *)
val action_code : unit Codelib.code
