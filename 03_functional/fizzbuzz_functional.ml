(* fizzbuzz the functional way
   classic interview question solved using
   higher order functions instead of if-else chains *)

(* a rule is a function that returns Some string if it matches
   or None if it doesn't *)
    let divisible_by n x = x mod n = 0

let fizz n =
  if divisible_by 3 n then Some "fizz" else None

let buzz n =
  if divisible_by 5 n then Some "buzz" else None

let bang n =
  if divisible_by 7 n then Some "bang" else None

(* combine all rules - this is the functional magic *)
let apply_rules n rules =
  let combined = List.fold_left (fun acc rule ->
    match rule n with
    | Some s -> acc ^ s
    | None   -> acc
  ) "" rules
  in
  if combined = "" then string_of_int n else combined

(* run fizzbuzz from 1 to n using map *)
let fizzbuzz n rules =
  List.init n (fun i -> apply_rules (i + 1) rules)

(* a higher order function that builds custom rules *)
let make_rule divisor word n =
  if divisible_by divisor n then Some word else None

let () =
  Printf.printf "=== functional fizzbuzz ===\n";
  Printf.printf "enter how many numbers (e.g. 20): ";
  let limit = int_of_string (read_line ()) in

  let rules = [fizz; buzz] in
  let results = fizzbuzz limit rules in
  List.iter (fun s -> Printf.printf "%s\n" s) results;

  Printf.printf "\nwant to add a custom rule? (yes/no): ";
  let add_custom = read_line () in

  if add_custom = "yes" then begin
    Printf.printf "enter divisor: ";
    let div = int_of_string (read_line ()) in
    Printf.printf "enter word: ";
    let word = read_line () in
    let custom_rule = make_rule div word in
    let new_rules = [fizz; buzz; custom_rule] in
    let new_results = fizzbuzz limit new_rules in
    Printf.printf "\n=== with your custom rule ===\n";
    List.iter (fun s -> Printf.printf "%s\n" s) new_results
  end