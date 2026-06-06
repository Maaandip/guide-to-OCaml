(* Basic Functions in OCaml *)

(* simple function *)
let greet name =
  Printf.printf "Hello, %s!\n" name

(* function with two arguments *)
let add x y = x + y

(* function with return value *)
let square x = x * x

(* function with float *)
let circle_area radius =
  let pi = 3.14159 in
  pi *. radius *. radius

(* anonymous function *)
let multiply = fun x y -> x * y

(* main *)
let () =
  greet "Mandip";
  Printf.printf "add 3 and 4 = %d\n" (add 3 4);
  Printf.printf "square of 5 = %d\n" (square 5);
  Printf.printf "area of circle with radius 7.0 = %.2f\n" (circle_area 7.0);
  Printf.printf "product of 6 and 7 = %d\n" (multiply 6 7)