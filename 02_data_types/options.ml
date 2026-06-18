(* option type in OCaml
   used when a value might or might not exist
   like null in other languages but much safer
   forces you to handle the "nothing" case *)

(* option is built into OCaml
   type 'a option = Some of 'a | None *)

(* find element in list - returns option *)
let rec find lst target =
  match lst with
  | [] -> None
  | head :: tail ->
      if head = target then Some head
      else find tail target

(* safe division *)
let safe_div a b =
  if b = 0 then None
  else Some (a / b)

(* safe head of list *)
let safe_head lst =
  match lst with
  | [] -> None
  | head :: _ -> Some head

(* chain options together *)
let safe_sqrt x =
  if x < 0.0 then None
  else Some (sqrt x)

(* unwrap with default *)
let get_or_default opt default =
  match opt with
  | Some v -> v
  | None   -> default

let print_int_option label opt =
  match opt with
  | Some v -> Printf.printf "%s: %d\n" label v
  | None   -> Printf.printf "%s: nothing found\n" label

let () =
  let numbers = [10; 20; 30; 40; 50] in

  Printf.printf "enter a number to search in [10;20;30;40;50]: ";
  let target = int_of_string (read_line ()) in
  print_int_option "search result" (find numbers target);

  Printf.printf "\nenter two integers to divide: ";
  let a = int_of_string (read_line ()) in
  let b = int_of_string (read_line ()) in
  print_int_option "division result" (safe_div a b);

  Printf.printf "\nenter a float for square root: ";
  let x = float_of_string (read_line ()) in
  (match safe_sqrt x with
  | Some v -> Printf.printf "sqrt %.2f = %.4f\n" x v
  | None   -> Printf.printf "cannot take sqrt of negative number\n");

  Printf.printf "\nenter default value: ";
  let def = int_of_string (read_line ()) in
  Printf.printf "safe_head of empty list = %d\n"
    (get_or_default (safe_head []) def)