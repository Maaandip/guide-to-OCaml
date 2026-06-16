(* records in OCaml
   records are like structs in C++ or dictionaries in Python
   but with fixed fields and types
   great for grouping related data together *)

(* define a record type *)
type student = {
  name   : string;
  age    : int;
  grade  : float;
  passed : bool;
}

type stock = {
  ticker : string;
  price  : float;
  volume : int;
  change : float;
}

(* create a record *)
let make_student name age grade = {
  name;
  age;
  grade;
  passed = grade >= 40.0;
}

(* access fields *)
let print_student s =
  Printf.printf "name:   %s\n" s.name;
  Printf.printf "age:    %d\n" s.age;
  Printf.printf "grade:  %.1f\n" s.grade;
  Printf.printf "passed: %b\n" s.passed

(* update a record - OCaml records are immutable
   so we create a new one with updated fields *)
let update_grade s new_grade =
  { s with grade = new_grade; passed = new_grade >= 40.0 }

let print_stock s =
  Printf.printf "\nticker: %s\n" s.ticker;
  Printf.printf "price:  %.2f\n" s.price;
  Printf.printf "volume: %d\n" s.volume;
  if s.change >= 0.0 then
    Printf.printf "change: +%.2f%%\n" s.change
  else
    Printf.printf "change: %.2f%%\n" s.change

let () =
  Printf.printf "=== student record ===\n";
  Printf.printf "enter name: ";
  let name = read_line () in
  Printf.printf "enter age: ";
  let age = int_of_string (read_line ()) in
  Printf.printf "enter grade: ";
  let grade = float_of_string (read_line ()) in

  let s = make_student name age grade in
  print_student s;

  Printf.printf "\nupdate grade? enter new grade: ";
  let new_grade = float_of_string (read_line ()) in
  let updated = update_grade s new_grade in
  Printf.printf "\nafter update:\n";
  print_student updated;

  Printf.printf "\n=== stock record ===\n";
  Printf.printf "enter ticker: ";
  let ticker = read_line () in
  Printf.printf "enter price: ";
  let price = float_of_string (read_line ()) in
  Printf.printf "enter volume: ";
  let volume = int_of_string (read_line ()) in
  Printf.printf "enter change %%: ";
  let change = float_of_string (read_line ()) in

  let stock = { ticker; price; volume; change } in
  print_stock stock