(* exceptions in OCaml
   used to handle errors and unexpected situations
   similar to try/catch in other languages
   but OCaml also has option/result types which are preferred *)

(* define custom exceptions *)
exception Division_by_zero_custom of string
exception Negative_input of int
exception Out_of_range of int * int * int

(* function that raises exception *)
let safe_div a b =
  if b = 0 then
    raise (Division_by_zero_custom "cannot divide by zero!")
  else
    a / b

let safe_sqrt x =
  if x < 0 then
    raise (Negative_input x)
  else
    sqrt (float_of_int x)

let get_element lst idx =
  let len = List.length lst in
  if idx < 0 || idx >= len then
    raise (Out_of_range (idx, 0, len - 1))
  else
    List.nth lst idx

(* handling exceptions with try/with *)
let try_divide a b =
  try
    let result = safe_div a b in
    Printf.printf "%d / %d = %d\n" a b result
  with
  | Division_by_zero_custom msg ->
      Printf.printf "error: %s\n" msg
  | _ ->
      Printf.printf "unknown error\n"

let try_sqrt x =
  try
    let result = safe_sqrt x in
    Printf.printf "sqrt %d = %.4f\n" x result
  with
  | Negative_input n ->
      Printf.printf "error: cannot take sqrt of %d\n" n

let () =
  Printf.printf "=== exceptions in OCaml ===\n\n";

  Printf.printf "enter two numbers to divide: ";
  let a = int_of_string (read_line ()) in
  let b = int_of_string (read_line ()) in
  try_divide a b;

  Printf.printf "\nenter a number for sqrt: ";
  let x = int_of_string (read_line ()) in
  try_sqrt x;

  let lst = [10; 20; 30; 40; 50] in
  Printf.printf "\nlist is [10;20;30;40;50]\n";
  Printf.printf "enter index to access: ";
  let idx = int_of_string (read_line ()) in
  (try
    Printf.printf "element at %d = %d\n" idx (get_element lst idx)
  with
  | Out_of_range (i, lo, hi) ->
      Printf.printf "error: index %d out of range [%d, %d]\n" i lo hi)