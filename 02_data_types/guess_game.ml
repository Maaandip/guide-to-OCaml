(* number guessing game in OCaml
   uses variants, recursion, and pattern matching
   computer picks a random number, you guess it *)

   type hint =
   | TooHigh
   | TooLow
   | Correct
 
 let get_hint guess target =
   if guess > target then TooHigh
   else if guess < target then TooLow
   else Correct
 
 let print_hint hint =
   match hint with
   | TooHigh -> Printf.printf "too high! try lower\n"
   | TooLow  -> Printf.printf "too low! try higher\n"
   | Correct -> Printf.printf "correct! you got it!\n"
 
 let rec play target attempts =
   Printf.printf "\nattempt %d - enter your guess (1-100): " attempts;
   let guess = int_of_string (read_line ()) in
   let hint = get_hint guess target in
   print_hint hint;
   match hint with
   | Correct -> Printf.printf "\nyou won in %d attempts!\n" attempts
   | _       -> play target (attempts + 1)
 
 let () =
   Random.self_init ();
   let target = Random.int 100 + 1 in
 
   Printf.printf "=== number guessing game ===\n";
   Printf.printf "i'm thinking of a number between 1 and 100\n";
 
   play target 1