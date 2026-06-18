(* variants in OCaml
   also called sum types or algebraic data types
   think of them as enums but way more powerful
   this is one of OCaml's best features *)

(* simple variant - like an enum *)
type day =
  | Monday
  | Tuesday
  | Wednesday
  | Thursday
  | Friday
  | Saturday
  | Sunday

(* variant with data attached *)
type shape =
  | Circle    of float
  | Rectangle of float * float
  | Triangle  of float * float * float

(* variant for results - very common in OCaml *)
type result =
  | Ok    of float
  | Error of string

(* pattern match on variants *)
let is_weekend day =
  match day with
  | Saturday | Sunday -> true
  | _ -> false

let area shape =
  match shape with
  | Circle r         -> 3.14159 *. r *. r
  | Rectangle (w, h) -> w *. h
  | Triangle (a, b, c) ->
      let s = (a +. b +. c) /. 2.0 in
      sqrt (s *. (s-.a) *. (s-.b) *. (s-.c))

let safe_divide a b =
  if b = 0.0 then Error "cannot divide by zero"
  else Ok (a /. b)

let day_of_int n =
  match n with
  | 1 -> Monday | 2 -> Tuesday | 3 -> Wednesday
  | 4 -> Thursday | 5 -> Friday | 6 -> Saturday
  | 7 -> Sunday  | _ -> Monday

let () =
  Printf.printf "enter day number (1-7): ";
  let n = int_of_string (read_line ()) in
  let day = day_of_int n in
  if is_weekend day then
    Printf.printf "day %d is a weekend!\n" n
  else
    Printf.printf "day %d is a weekday\n" n;

  Printf.printf "\nenter radius for circle: ";
  let r = float_of_string (read_line ()) in
  Printf.printf "circle area = %.2f\n" (area (Circle r));

  Printf.printf "\nenter width and height for rectangle: ";
  let w = float_of_string (read_line ()) in
  let h = float_of_string (read_line ()) in
  Printf.printf "rectangle area = %.2f\n" (area (Rectangle (w, h)));

  Printf.printf "\ndivide two numbers\n";
  Printf.printf "enter a: ";
  let a = float_of_string (read_line ()) in
  Printf.printf "enter b: ";
  let b = float_of_string (read_line ()) in
  match safe_divide a b with
  | Ok result    -> Printf.printf "result = %.4f\n" result
  | Error msg    -> Printf.printf "error: %s\n" msg