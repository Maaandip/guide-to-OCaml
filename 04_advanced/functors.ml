(* Functors in OCaml
   a Functor is a module that takes another module as input
   and produces a new module - "functions for modules"
   this is what makes OCaml's type system so powerful *)

(* a module signature - defines what a comparable type needs *)
module type COMPARABLE = sig
  type t
  val compare : t -> t -> int
end

(* a functor that creates sorting functions for any comparable type *)
module MakeSorter (C : COMPARABLE) = struct
  let sort lst =
    List.sort C.compare lst

  let max_element lst =
    List.fold_left (fun acc x ->
      if C.compare x acc > 0 then x else acc
    ) (List.hd lst) lst

  let min_element lst =
    List.fold_left (fun acc x ->
      if C.compare x acc < 0 then x else acc
    ) (List.hd lst) lst
end

(* now create modules for specific types *)
module IntComparable = struct
  type t = int
  let compare a b = compare a b
end

module StringComparable = struct
  type t = string
  let compare a b = String.compare a b
end

(* build the actual sorters using the functor *)
module IntSorter = MakeSorter (IntComparable)
module StringSorter = MakeSorter (StringComparable)

let print_int_list lst =
  List.iter (fun x -> Printf.printf "%d " x) lst;
  Printf.printf "\n"

let print_string_list lst =
  List.iter (fun x -> Printf.printf "%s " x) lst;
  Printf.printf "\n"

let () =
  Printf.printf "=== functor with integers ===\n";
  Printf.printf "enter how many numbers: ";
  let n = int_of_string (read_line ()) in
  let int_lst = List.init n (fun _ ->
    Printf.printf "enter number: ";
    int_of_string (read_line ())
  ) in
  Printf.printf "sorted: ";
  print_int_list (IntSorter.sort int_lst);
  Printf.printf "max: %d\n" (IntSorter.max_element int_lst);
  Printf.printf "min: %d\n" (IntSorter.min_element int_lst);

  Printf.printf "\n=== same functor with strings ===\n";
  Printf.printf "enter how many words: ";
  let m = int_of_string (read_line ()) in
  let str_lst = List.init m (fun _ ->
    Printf.printf "enter word: ";
    read_line ()
  ) in
  Printf.printf "sorted: ";
  print_string_list (StringSorter.sort str_lst);
  Printf.printf "max (alphabetically last): %s\n" (StringSorter.max_element str_lst)
