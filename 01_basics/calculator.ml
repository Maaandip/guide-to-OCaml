(* calculator in OCaml
   mini project using everything from basics
   functions, pattern matching, recursion, input, loops *)

   let add a b = a +. b
   let sub a b = a -. b
   let mul a b = a *. b
   let div a b = 
     if b = 0.0 then
       (Printf.printf "error: cannot divide by zero\n"; 0.0)
     else a /. b
   
   let calculate op a b =
     match op with
     | "+" -> add a b
     | "-" -> sub a b
     | "*" -> mul a b
     | "/" -> div a b
     | _ -> (Printf.printf "unknown operator\n"; 0.0)
   
   let rec run () =
     Printf.printf "\nenter first number: ";
     let a = float_of_string (read_line ()) in
     Printf.printf "enter operator (+, -, *, /): ";
     let op = read_line () in
     Printf.printf "enter second number: ";
     let b = float_of_string (read_line ()) in
     let result = calculate op a b in
     Printf.printf "result = %.2f\n" result;
     Printf.printf "\ncalculate again? (yes/no): ";
     let again = read_line () in
     if again = "yes" then run ()
     else Printf.printf "okay bye!\n"
   
   let () =
     Printf.printf "=== calculator in OCaml ===\n";
     run ()