(* memoization in OCaml
   cache expensive function results so we don't
   compute the same thing twice
   classic example: fibonacci without memoization is O(2^n)
   with memoization it becomes O(n) *)

(* slow fibonacci - exponential time *)
let rec fib_slow n =
  if n <= 1 then n
  else fib_slow (n-1) + fib_slow (n-2)

(* fast fibonacci with memoization using hashtable *)
let fib_memo =
  let cache = Hashtbl.create 100 in
  let rec fib n =
    match Hashtbl.find_opt cache n with
    | Some v ->
        Printf.printf "(cache hit for %d) " n;
        v
    | None ->
        let result =
          if n <= 1 then n
          else fib (n-1) + fib (n-2)
        in
        Hashtbl.add cache n result;
        result
  in
  fib

(* generic memoize - works for any function *)
let memoize f =
  let cache = Hashtbl.create 100 in
  fun x ->
    match Hashtbl.find_opt cache x with
    | Some v -> v
    | None ->
        let result = f x in
        Hashtbl.add cache x result;
        result

let memo_square = memoize (fun x -> x * x)

let () =
  Printf.printf "=== memoization ===\n\n";

  Printf.printf "enter fibonacci number (try 10-20): ";
  let n = int_of_string (read_line ()) in

  Printf.printf "slow fib(%d) = %d\n" n (fib_slow n);

  Printf.printf "\nmemo fib(%d) = " n;
  let fast = fib_memo n in
  Printf.printf "%d\n" fast;

  Printf.printf "\ncalling memo fib again (all from cache):\n";
  Printf.printf "memo fib(%d) = %d\n" n (fib_memo n);

  Printf.printf "\n=== memoized square ===\n";
  Printf.printf "enter a number: ";
  let x = int_of_string (read_line ()) in
  Printf.printf "square = %d\n" (memo_square x);
  Printf.printf "square again (from cache) = %d\n" (memo_square x)