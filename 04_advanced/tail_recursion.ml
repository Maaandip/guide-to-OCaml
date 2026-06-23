(* Tail recursion in OCaml
   Normal recursion builds up stack frames and can crash
   Tail recursion reuses the same stack frame - much safer
   OCaml optimizes tail calls automatically *)

(* Normal recursion - NOT tail recursive *)
let rec factorial_normal n =
  if n <= 1 then 1
  else n * factorial_normal (n - 1)
  (* problem: n * ... means it has to wait for recursive call
     builds up stack like: 5 * (4 * (3 * (2 * 1))) *)

(* tail recursive version using accumulator *)
let factorial_tail n =
  let rec aux n acc =
    if n <= 1 then acc
    else aux (n - 1) (n * acc)
    (* tail call: last thing is the recursive call itself *)
  in
  aux n 1

(* tail recursive fibonacci *)
let fibonacci_tail n =
  let rec aux n a b =
    if n = 0 then a
    else aux (n - 1) b (a + b)
  in
  aux n 0 1

(* tail recursive sum of list *)
let sum_list lst =
  let rec aux lst acc =
    match lst with
    | [] -> acc
    | head :: tail -> aux tail (acc + head)
  in
  aux lst 0

(* tail recursive reverse *)
let reverse_list lst =
  let rec aux lst acc =
    match lst with
    | [] -> acc
    | head :: tail -> aux tail (head :: acc)
  in
  aux lst []

let () =
  Printf.printf "=== tail recursion ===\n\n";

  Printf.printf "enter a number for factorial: ";
  let n = int_of_string (read_line ()) in
  Printf.printf "normal factorial %d = %d\n" n (factorial_normal n);
  Printf.printf "tail factorial %d   = %d\n" n (factorial_tail n);

  Printf.printf "\nenter a number for fibonacci: ";
  let f = int_of_string (read_line ()) in
  Printf.printf "fibonacci %d = %d\n" f (fibonacci_tail f);

  Printf.printf "\nenter how many numbers for list: ";
  let count = int_of_string (read_line ()) in
  let lst = List.init count (fun _ ->
    Printf.printf "enter number: ";
    int_of_string (read_line ())
  ) in
  Printf.printf "sum     = %d\n" (sum_list lst);
  Printf.printf "reversed: ";
  List.iter (fun x -> Printf.printf "%d " x) (reverse_list lst);
  Printf.printf "\n"
