(* Strings in OCaml *)

let language = "OCaml"
let version = "5.0"
let full_intro = "learning " ^ language ^ " version " ^ version
let lang_length = String.length language

let upper = String.uppercase_ascii language
let lower = String.lowercase_ascii language

let reverse_string s =
  let len = String.length s in
  String.init len (fun i -> s.[len - 1 - i])

let starts_with str prefix =
  let plen = String.length prefix in
  String.length str >= plen &&
  String.sub str 0 plen = prefix

let () =
  Printf.printf "%s\n" full_intro;
  Printf.printf "length: %d\n" lang_length;
  Printf.printf "uppercase: %s\n" upper;
  Printf.printf "lowercase: %s\n" lower;
  Printf.printf "reversed: %s\n" (reverse_string language);
  Printf.printf "starts with 'OC': %b\n" (starts_with language "OC")