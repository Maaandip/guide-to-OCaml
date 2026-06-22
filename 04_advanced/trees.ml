(* binary trees in OCaml
   one of the most elegant uses of variants and recursion
   in OCaml trees feel completely natural to write *)

(* define a binary tree using variants *)
type 'a tree =
  | Empty
  | Node of 'a * 'a tree * 'a tree

(* insert into binary search tree *)
let rec insert x = function
  | Empty -> Node (x, Empty, Empty)
  | Node (v, left, right) ->
      if x < v then Node (v, insert x left, right)
      else if x > v then Node (v, left, insert x right)
      else Node (v, left, right)  (* already exists *)

(* search in tree *)
let rec search x = function
  | Empty -> false
  | Node (v, left, right) ->
      if x = v then true
      else if x < v then search x left
      else search x right

(* in-order traversal - gives sorted output! *)
let rec inorder = function
  | Empty -> []
  | Node (v, left, right) ->
      inorder left @ [v] @ inorder right

(* height of tree *)
let rec height = function
  | Empty -> 0
  | Node (_, left, right) ->
      1 + max (height left) (height right)

(* count nodes *)
let rec count = function
  | Empty -> 0
  | Node (_, left, right) ->
      1 + count left + count right

(* build tree from list *)
let build_tree lst =
  List.fold_left (fun tree x -> insert x tree) Empty lst

let () =
  Printf.printf "=== binary search tree ===\n\n";

  Printf.printf "enter how many numbers to insert: ";
  let n = int_of_string (read_line ()) in
  let lst = List.init n (fun _ ->
    Printf.printf "enter number: ";
    int_of_string (read_line ())
  ) in

  let tree = build_tree lst in

  Printf.printf "\nin-order (sorted): ";
  List.iter (fun x -> Printf.printf "%d " x) (inorder tree);
  Printf.printf "\n";

  Printf.printf "tree height: %d\n" (height tree);
  Printf.printf "node count:  %d\n" (count tree);

  Printf.printf "\nenter a number to search: ";
  let target = int_of_string (read_line ()) in
  if search target tree then
    Printf.printf "%d found in tree!\n" target
  else
    Printf.printf "%d not found in tree\n" target