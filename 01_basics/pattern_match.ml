(* pattern matching in OCaml
   think of it as a cleaner way to write if-else
   especially useful when checking many conditions *)

   let day_name n =
    match n with
    | 1 -> "monday"
    | 2 -> "tuesday"
    | 3 -> "wednesday"
    | 4 -> "thursday"
    | 5 -> "friday"
    | 6 -> "saturday"
    | 7 -> "sunday"
    | _ -> "not a valid day"  (* _ means anything else *)
  
  let language_type lang =
    match lang with
    | "ocaml" -> "functional"
    | "python" -> "interpreted"
    | "c++" -> "systems"
    | "java" -> "object oriented"
    | _ -> "hmm never heard of that one"
  
  let classify n =
    match n with
    | 0 -> "zero"
    | n when n > 0 -> "positive"
    | _ -> "negative"
  
  let () =
    Printf.printf "enter a day number (1-7): ";
    let day = int_of_string (read_line ()) in
    Printf.printf "day %d is %s\n" day (day_name day);
  
    Printf.printf "enter a language: ";
    let lang = read_line () in
    Printf.printf "%s is %s\n" lang (language_type lang);
  
    Printf.printf "enter any number: ";
    let n = int_of_string (read_line ()) in
    Printf.printf "%d is %s\n" n (classify n)