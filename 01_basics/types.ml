(* types in OCaml
   OCaml is statically typed - every value has a type
   and the compiler checks everything before running
   this catches so many bugs before they happen *)

   let int_ops a b =
    Printf.printf "add: %d\n" (a + b);
    Printf.printf "sub: %d\n" (a - b);
    Printf.printf "mul: %d\n" (a * b);
    Printf.printf "div: %d\n" (a / b);
    Printf.printf "mod: %d\n" (a mod b)
  
  let float_ops a b =
    Printf.printf "add: %.2f\n" (a +. b);
    Printf.printf "sub: %.2f\n" (a -. b);
    Printf.printf "mul: %.2f\n" (a *. b);
    Printf.printf "div: %.2f\n" (a /. b)
  
  let bool_ops a b =
    Printf.printf "and: %b\n" (a && b);
    Printf.printf "or:  %b\n" (a || b);
    Printf.printf "not: %b\n" (not a)
  
  let () =
    Printf.printf "--- basic types from your input ---\n";
  
    Printf.printf "enter a string: ";
    let s = read_line () in
    Printf.printf "you entered string: %s\n" s;
  
    Printf.printf "enter a char: ";
    let c = (read_line ()).[0] in
    Printf.printf "you entered char: %c\n" c;
  
    Printf.printf "\n--- int operations ---\n";
    Printf.printf "enter first integer: ";
    let a = int_of_string (read_line ()) in
    Printf.printf "enter second integer: ";
    let b = int_of_string (read_line ()) in
    int_ops a b;
  
    Printf.printf "\n--- float operations ---\n";
    Printf.printf "enter first float: ";
    let x = float_of_string (read_line ()) in
    Printf.printf "enter second float: ";
    let y = float_of_string (read_line ()) in
    float_ops x y;
  
    Printf.printf "\n--- bool operations ---\n";
    Printf.printf "enter true or false: ";
    let p = bool_of_string (read_line ()) in
    Printf.printf "enter true or false: ";
    let q = bool_of_string (read_line ()) in
    bool_ops p q