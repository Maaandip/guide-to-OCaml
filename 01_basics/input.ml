(* Reading User Input in OCaml *)

(* read a string from user *)
let read_name () =
  Printf.printf "enter your name: ";
  read_line ()

(* read an integer from user *)
let read_number () =
  Printf.printf "enter a number: ";
  int_of_string (read_line ())

(* read a float *)
let read_float_val () =
  Printf.printf "enter a float: ";
  float_of_string (read_line ())

(* simple calculator using input *)
let simple_calc () =
  Printf.printf "enter first number: ";
  let a = int_of_string (read_line ()) in
  Printf.printf "enter second number: ";
  let b = int_of_string (read_line ()) in
  Printf.printf "%d + %d = %d\n" a b (a + b);
  Printf.printf "%d - %d = %d\n" a b (a - b);
  Printf.printf "%d * %d = %d\n" a b (a * b);
  if b <> 0 then
    Printf.printf "%d / %d = %d\n" a b (a / b)
  else
    Printf.printf "cannot divide by zero\n"

(* main *)
let () =
  let name = read_name () in
  Printf.printf "hello %s!\n" name;
  simple_calc ()