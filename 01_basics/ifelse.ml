(* If-Else in OCaml - Interactive *)

let max_of_two a b =
  if a > b then a
  else b

let grade marks =
  if marks >= 90 then "A"
  else if marks >= 80 then "B"
  else if marks >= 70 then "C"
  else if marks >= 60 then "D"
  else "F"

let is_even n =
  if n mod 2 = 0 then true
  else false

let classify_number n =
  if n > 0 then "positive"
  else if n < 0 then "negative"
  else "zero"

let () =
  (* age check *)
  Printf.printf "enter your age: ";
  let age = int_of_string (read_line ()) in
  if age >= 18 then Printf.printf "you can vote\n"
  else Printf.printf "you cannot vote\n";

  (* two numbers *)
  Printf.printf "enter first number: ";
  let a = int_of_string (read_line ()) in
  Printf.printf "enter second number: ";
  let b = int_of_string (read_line ()) in
  Printf.printf "max = %d\n" (max_of_two a b);
  Printf.printf "is %d even = %b\n" a (is_even a);
  Printf.printf "%d is %s\n" b (classify_number b);

  (* marks *)
  Printf.printf "enter your marks: ";
  let marks = int_of_string (read_line ()) in
  Printf.printf "your grade = %s\n" (grade marks)