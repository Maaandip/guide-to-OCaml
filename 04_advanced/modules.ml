(* modules in OCaml
   modules group related functions and types together
   like namespaces in C++ or packages in Java
   helps organize larger codebases *)

(* define a module *)
module MathUtils = struct
  let pi = 3.14159

  let square x = x * x

  let circle_area r = pi *. r *. r

  let is_prime n =
    if n < 2 then false
    else
      let rec check i =
        if i * i > n then true
        else if n mod i = 0 then false
        else check (i + 1)
      in
      check 2
end

module StringUtils = struct
  let reverse s =
    let len = String.length s in
    String.init len (fun i -> s.[len - 1 - i])

  let is_palindrome s =
    s = reverse s

  let count_vowels s =
    let vowels = ['a';'e';'i';'o';'u'] in
    String.fold_left (fun acc c ->
      if List.mem (Char.lowercase_ascii c) vowels
      then acc + 1 else acc
    ) 0 s
end

(* using the modules with dot notation *)
let () =
  Printf.printf "=== math utils module ===\n";
  Printf.printf "enter a number to check prime: ";
  let n = int_of_string (read_line ()) in
  Printf.printf "%d is prime: %b\n" n (MathUtils.is_prime n);

  Printf.printf "enter radius for circle: ";
  let r = float_of_string (read_line ()) in
  Printf.printf "circle area: %.2f\n" (MathUtils.circle_area r);

  Printf.printf "\n=== string utils module ===\n";
  Printf.printf "enter a word to check palindrome: ";
  let word = read_line () in
  Printf.printf "reversed: %s\n" (StringUtils.reverse word);
  Printf.printf "is palindrome: %b\n" (StringUtils.is_palindrome word);
  Printf.printf "vowel count: %d\n" (StringUtils.count_vowels word)