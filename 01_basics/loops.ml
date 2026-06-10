(* loops in OCaml
   OCaml has for and while loops but honestly
   most OCaml programmers prefer recursion over loops
   still good to know both *)

(* basic for loop *)
let print_numbers () =
  for i = 1 to 10 do
    Printf.printf "%d " i
  done;
  Printf.printf "\n"

(* for loop countdown *)
let countdown () =
  for i = 10 downto 1 do
    Printf.printf "%d " i
  done;
  Printf.printf "go!\n"

(* while loop *)
let count_up limit =
  let i = ref 0 in
  while !i < limit do
    Printf.printf "%d " !i;
    i := !i + 1
  done;
  Printf.printf "\n"

(* sum using for loop *)
let sum_to n =
  let total = ref 0 in
  for i = 1 to n do
    total := !total + i
  done;
  !total

(* multiplication table *)
let times_table n =
  Printf.printf "multiplication table for %d\n" n;
  for i = 1 to 10 do
    Printf.printf "%d x %d = %d\n" n i (n * i)
  done

let () =
  Printf.printf "numbers 1 to 10: ";
  print_numbers ();

  Printf.printf "countdown: ";
  countdown ();

  Printf.printf "enter a limit for while loop: ";
  let limit = int_of_string (read_line ()) in
  count_up limit;

  Printf.printf "enter n to sum 1 to n: ";
  let n = int_of_string (read_line ()) in
  Printf.printf "sum 1 to %d = %d\n" n (sum_to n);

  Printf.printf "enter a number for times table: ";
  let t = int_of_string (read_line ()) in
  times_table t