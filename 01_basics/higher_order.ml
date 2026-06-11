(* higher order functions in OCaml
   functions that take other functions as arguments
   this is where OCaml starts getting really powerful *)

   let print_list lst =
    List.iter (fun x -> Printf.printf "%d " x) lst;
    Printf.printf "\n"
  
  let square x = x * x
  let double x = x * 2
  let increment x = x + 1
  let apply_twice f x = f (f x)
  
  let () =
    Printf.printf "enter how many numbers you want in your list: ";
    let n = int_of_string (read_line ()) in
    
    (* build list from user input *)
    let lst = List.init n (fun _ ->
      Printf.printf "enter a number: ";
      int_of_string (read_line ())
    ) in
  
    Printf.printf "your list:     ";
    print_list lst;
  
    Printf.printf "doubled:       ";
    print_list (List.map double lst);
  
    Printf.printf "squared:       ";
    print_list (List.map square lst);
  
    Printf.printf "evens only:    ";
    print_list (List.filter (fun x -> x mod 2 = 0) lst);
  
    Printf.printf "sum of list:   %d\n"
      (List.fold_left (fun acc x -> acc + x) 0 lst);
  
    Printf.printf "\nenter a number to apply_twice double: ";
    let x = int_of_string (read_line ()) in
    Printf.printf "result = %d\n" (apply_twice double x)