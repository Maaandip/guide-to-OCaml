(* Map, filter and fold in OCaml
   the three most important functions in functional programming
   master these and you understand functional programming *)

(* map - transform every element, same list length *)
let demo_map lst =
  Printf.printf "original:        ";
  List.iter (fun x -> Printf.printf "%d " x) lst;
  Printf.printf "\n";

  let squared = List.map (fun x -> x * x) lst in
  Printf.printf "squared:         ";
  List.iter (fun x -> Printf.printf "%d " x) squared;
  Printf.printf "\n";

  let as_strings = List.map (fun x -> "n" ^ string_of_int x) lst in
  Printf.printf "as strings:      ";
  List.iter (fun s -> Printf.printf "%s " s) as_strings;
  Printf.printf "\n"

(* filter - keep elements matching condition, list can shrink *)
let demo_filter lst =
  let evens = List.filter (fun x -> x mod 2 = 0) lst in
  Printf.printf "evens:           ";
  List.iter (fun x -> Printf.printf "%d " x) evens;
  Printf.printf "\n";

  let above_avg =
    let sum = List.fold_left (+) 0 lst in
    let avg = sum / List.length lst in
    List.filter (fun x -> x > avg) lst
  in
  Printf.printf "above average:   ";
  List.iter (fun x -> Printf.printf "%d " x) above_avg;
  Printf.printf "\n"

(* fold - reduce list to a single value *)
let demo_fold lst =
  let sum = List.fold_left (fun acc x -> acc + x) 0 lst in
  Printf.printf "sum:             %d\n" sum;

  let product = List.fold_left (fun acc x -> acc * x) 1 lst in
  Printf.printf "product:         %d\n" product;

  let max_val = List.fold_left max (List.hd lst) lst in
  Printf.printf "max:             %d\n" max_val;

  let min_val = List.fold_left min (List.hd lst) lst in
  Printf.printf "min:             %d\n" min_val;

  (* fold_left vs fold_right - building a string *)
  let left_concat = List.fold_left
    (fun acc x -> acc ^ string_of_int x) "" lst in
  Printf.printf "fold_left concat:  %s\n" left_concat;

  let right_concat = List.fold_right
    (fun x acc -> string_of_int x ^ acc) lst "" in
  Printf.printf "fold_right concat: %s\n" right_concat

(* chaining map, filter, fold together - real power *)
let demo_chain lst =
  let result =
    lst
    |> List.filter (fun x -> x mod 2 = 0)   (* keep evens *)
    |> List.map (fun x -> x * x)            (* square them *)
    |> List.fold_left (+) 0                 (* sum them up *)
  in
  Printf.printf "sum of squares of evens: %d\n" result

let () =
  Printf.printf "enter how many numbers you want: ";
  let n = int_of_string (read_line ()) in
  let lst = List.init n (fun _ ->
    Printf.printf "enter number: ";
    int_of_string (read_line ())
  ) in

  Printf.printf "\n--- map ---\n";
  demo_map lst;

  Printf.printf "\n--- filter ---\n";
  demo_filter lst;

  Printf.printf "\n--- fold ---\n";
  demo_fold lst;

  Printf.printf "\n--- chaining everything ---\n";
  demo_chain lst
