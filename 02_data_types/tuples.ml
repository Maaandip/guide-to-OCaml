(* tuples in OCaml
   tuples group different types together
   unlike lists - elements can be different types
   and the size is fixed *)

(* basic tuple *)
let point = (3, 4)
let person = ("monodip", 20, "nfsu")
let stock  = ("TCS", 3650.50, true)

(* accessing tuple elements *)
let fst_example = fst (1, 2)   (* gets first *)
let snd_example = snd (1, 2)   (* gets second *)

(* pattern matching on tuples - most common way *)
let describe_point (x, y) =
  Printf.printf "point: (%d, %d)\n" x y;
  if x = 0 && y = 0 then Printf.printf "origin\n"
  else if x = 0 then Printf.printf "on y-axis\n"
  else if y = 0 then Printf.printf "on x-axis\n"
  else Printf.printf "in quadrant %d\n"
    (if x > 0 && y > 0 then 1
     else if x < 0 && y > 0 then 2
     else if x < 0 && y < 0 then 3
     else 4)

(* swap a tuple *)
let swap (a, b) = (b, a)

(* distance between two points *)
let distance (x1, y1) (x2, y2) =
  let dx = float_of_int (x2 - x1) in
  let dy = float_of_int (y2 - y1) in
  sqrt (dx *. dx +. dy *. dy)

let () =
  Printf.printf "enter x coordinate: ";
  let x = int_of_string (read_line ()) in
  Printf.printf "enter y coordinate: ";
  let y = int_of_string (read_line ()) in
  let p = (x, y) in
  describe_point p;

  let (sx, sy) = swap p in
  Printf.printf "swapped: (%d, %d)\n" sx sy;

  Printf.printf "\nenter second point x: ";
  let x2 = int_of_string (read_line ()) in
  Printf.printf "enter second point y: ";
  let y2 = int_of_string (read_line ()) in
  Printf.printf "distance between points: %.2f\n" (distance p (x2, y2))