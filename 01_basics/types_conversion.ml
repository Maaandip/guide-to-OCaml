(* type conversion in OCaml
   OCaml never converts types automatically
   you have to be explicit - which is actually a good thing
   no surprises like in Python or JavaScript *)

   let () =
   (* int to float *)
   Printf.printf "enter an integer: ";
   let x = int_of_string (read_line ()) in
   let x_float = float_of_int x in
   Printf.printf "int %d to float = %.2f\n" x x_float;
 
   (* float to int - truncates decimal *)
   Printf.printf "\nenter a float: ";
   let y = float_of_string (read_line ()) in
   let y_int = int_of_float y in
   Printf.printf "float %.2f to int = %d\n" y y_int;
 
   (* int to string *)
   Printf.printf "\nenter an integer: ";
   let n = int_of_string (read_line ()) in
   let n_str = string_of_int n in
   Printf.printf "int %d to string = %s\n" n n_str;
 
   (* string to int *)
   Printf.printf "\nenter a number as text: ";
   let s = read_line () in
   let s_int = int_of_string s in
   Printf.printf "string %s to int = %d\n" s s_int;
 
   (* string to float *)
   Printf.printf "\nenter a decimal number: ";
   let f_str = read_line () in
   let f = float_of_string f_str in
   Printf.printf "string %s to float = %.4f\n" f_str f;
 
   (* char to int - gives ASCII value *)
   Printf.printf "\nenter a single character: ";
   let c = (read_line ()).[0] in
   Printf.printf "char %c to int (ascii) = %d\n" c (Char.code c);
 
   (* int to char *)
   Printf.printf "\nenter a number between 0-255: ";
   let code = int_of_string (read_line ()) in
   Printf.printf "int %d to char = %c\n" code (Char.chr code)