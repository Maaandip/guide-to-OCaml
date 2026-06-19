(* Closures in OCaml
   a function that "remembers" variables from where it was created
   even after that outer function has finished running
   this is the foundation of functional programming *)

(* Simple closure - counter *)
let make_counter () =
  let count = ref 0 in
  fun () ->
    count := !count + 1;
    !count

(* closure with parameter - multiplier factory *)
let make_multiplier factor =
  fun x -> x * factor

(* closure that captures multiple values *)
let make_bank_account initial_balance =
  let balance = ref initial_balance in
  let deposit amount =
    balance := !balance + amount;
    Printf.printf "deposited %d, new balance: %d\n" amount !balance
  in
  let withdraw amount =
    if amount > !balance then
      Printf.printf "insufficient funds! balance: %d\n" !balance
    else begin
      balance := !balance - amount;
      Printf.printf "withdrew %d, new balance: %d\n" amount !balance
    end
  in
  (deposit, withdraw)

(* closure for memoization - cache results *)
let make_memoized_square () =
  let cache = Hashtbl.create 10 in
  fun x ->
    match Hashtbl.find_opt cache x with
    | Some result ->
        Printf.printf "(from cache) ";
        result
    | None ->
        let result = x * x in
        Hashtbl.add cache x result;
        result

let () =
  Printf.printf "=== counter closure ===\n";
  let counter1 = make_counter () in
  let counter2 = make_counter () in
  Printf.printf "counter1: %d\n" (counter1 ());
  Printf.printf "counter1: %d\n" (counter1 ());
  Printf.printf "counter1: %d\n" (counter1 ());
  Printf.printf "counter2: %d\n" (counter2 ());
  Printf.printf "(notice counter2 has its own separate count)\n";

  Printf.printf "\n=== multiplier closure ===\n";
  Printf.printf "enter a multiplier factor: ";
  let factor = int_of_string (read_line ()) in
  let multiply = make_multiplier factor in
  Printf.printf "enter a number to multiply: ";
  let n = int_of_string (read_line ()) in
  Printf.printf "result: %d\n" (multiply n);

  Printf.printf "\n=== bank account closure ===\n";
  Printf.printf "enter starting balance: ";
  let start = int_of_string (read_line ()) in
  let (deposit, withdraw) = make_bank_account start in
  Printf.printf "enter amount to deposit: ";
  let dep = int_of_string (read_line ()) in
  deposit dep;
  Printf.printf "enter amount to withdraw: ";
  let wd = int_of_string (read_line ()) in
  withdraw wd;

  Printf.printf "\n=== memoized square closure ===\n";
  let memo_square = make_memoized_square () in
  Printf.printf "enter a number: ";
  let m = int_of_string (read_line ()) in
  Printf.printf "square = %d\n" (memo_square m);
  Printf.printf "square again (should say from cache) = %d\n" (memo_square m)
