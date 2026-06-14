(* lists in OCaml
   lists are one of the most used data structures in OCaml
   they are immutable and singly linked
   every element must be the same type *)

(* basic list operations *)
let first_list = [1; 2; 3; 4; 5]
let string_list = ["ocaml"; "is"; "cool"]

(* add element to front - called cons operator *)
let extended = 0 :: first_list

(* combine two lists *)
let combined = first_list @ [6; 7; 8]

(* get first element *)
let head = List.hd first_list

(* get everything except first *)
let tail = List.tl first_list

(* length of list *)
let len = List.length first_list

(* reverse a list *)
let reversed = List.rev first_list

(* check if element exists *)
let has_three = List.mem 3 first_list

(* map over list *)
let doubled = List.map (fun x -> x * 2) first_list

(* filter list *)
let evens = List.filter (fun x -> x mod 2 = 0) first_list

(* fold to sum *)
let total = List.fold_left (fun acc x -> acc + x) 0 first_list

(* print a list *)
let print_list lst =
  List.iter (fun x -> Printf.printf "%d " x) lst;
  Printf.printf "\n"

let () =
  Printf.printf "enter how many numbers: ";
  let n = int_of_string (read_line ()) in
  let lst = List.init n (fun _ ->
    Printf.printf "enter number: ";
    int_of_string (read_line ())
  ) in

  Printf.printf "\nyour list:    ";
  print_list lst;

  Printf.printf "reversed:     ";
  print_list (List.rev lst);

  Printf.printf "doubled:      ";
  print_list (List.map (fun x -> x * 2) lst);

  Printf.printf "evens only:   ";
  print_list (List.filter (fun x -> x mod 2 = 0) lst);

  Printf.printf "sum:          %d\n" (List.fold_left (fun acc x -> acc + x) 0 lst);
  Printf.printf "length:       %d\n" (List.length lst);
  Printf.printf "first:        %d\n" (List.hd lst);
  Printf.printf "last:         %d\n" (List.nth lst (List.length lst - 1))