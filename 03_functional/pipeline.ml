(* Function composition and pipelines in OCaml
   the |> operator is one of the most loved features
   it lets you write code that reads left to right
   like a real Pipeline of data transformations *)

(* without pipe operator - hard to read, inside out *)
let process_old lst =
  List.fold_left (+) 0
    (List.map (fun x -> x * x)
      (List.filter (fun x -> x mod 2 = 0) lst))

(* with pipe operator - reads top to bottom, very clean *)
let process_new lst =
  lst
  |> List.filter (fun x -> x mod 2 = 0)
  |> List.map (fun x -> x * x)
  |> List.fold_left (+) 0

(* Function composition using >> style (custom operator) *)
let (>>) f g x = g (f x)

let double x = x * 2
let increment x = x + 1
let square x = x * x

(* compose three functions into one *)
let pipeline = double >> increment >> square

(* a real world example - cleaning and processing text *)
let word_count text =
  text
  |> String.split_on_char ' '
  |> List.filter (fun w -> String.length w > 0)
  |> List.length

let longest_word text =
  text
  |> String.split_on_char ' '
  |> List.filter (fun w -> String.length w > 0)
  |> List.fold_left (fun acc w ->
       if String.length w > String.length acc then w else acc
     ) ""

let () =
  Printf.printf "=== old vs new style ===\n";
  Printf.printf "enter how many numbers: ";
  let n = int_of_string (read_line ()) in
  let lst = List.init n (fun _ ->
    Printf.printf "enter number: ";
    int_of_string (read_line ())
  ) in
  Printf.printf "old style result: %d\n" (process_old lst);
  Printf.printf "new style result: %d\n" (process_new lst);

  Printf.printf "\n=== function composition ===\n";
  Printf.printf "enter a number for pipeline (double, increment, square): ";
  let x = int_of_string (read_line ()) in
  Printf.printf "pipeline result: %d\n" (pipeline x);

  Printf.printf "\n=== text processing pipeline ===\n";
  Printf.printf "enter a sentence: ";
  let text = read_line () in
  Printf.printf "word count: %d\n" (word_count text);
  Printf.printf "longest word: %s\n" (longest_word text)
