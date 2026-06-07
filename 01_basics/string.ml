(* Strings in OCaml *)

(* basic string *)
let name = "Mandip"
let university = "NFSU"

(* string concatenation *)
let full_intro = "My name is " ^ name ^ " from " ^ university

(* string length *)
let name_length = String.length name

(* uppercase and lowercase *)
let upper = String.uppercase_ascii name
let lower = String.lowercase_ascii name

(* check if string contains substring *)
let contains str sub =
  let str_len = String.length str in
  let sub_len = String.length sub in
  let rec check i =
    if i > str_len - sub_len then false
    else if String.sub str i sub_len = sub then true
    else check (i + 1)
  in
  check 0

(* reverse a string *)
let reverse_string s =
  let len = String.length s in
  String.init len (fun i -> s.[len - 1 - i])

(* split string by character *)
let starts_with str prefix =
  let plen = String.length prefix in
  String.length str >= plen &&
  String.sub str 0 plen = prefix

(* main *)
let () =
  Printf.printf "%s\n" full_intro;
  Printf.printf "length of name: %d\n" name_length;
  Printf.printf "uppercase: %s\n" upper;
  Printf.printf "lowercase: %s\n" lower;
  Printf.printf "contains 'and': %b\n" (contains name "and");
  Printf.printf "reversed: %s\n" (reverse_string name);
  Printf.printf "starts with 'Man': %b\n" (starts_with name "Man")