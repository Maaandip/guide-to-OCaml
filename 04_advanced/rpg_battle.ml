(* Mini RPG battle game using modules
   Combines modules, records, recursion and pattern matching
   simple turn based battle system *)

   module Character = struct
    type t = {
      name   : string;
      hp     : int ref;
      attack : int;
    }
  
    let create name hp attack = {
      name;
      hp = ref hp;
      attack;
    }
  
    let is_alive c = !(c.hp) > 0
  
    let take_damage c amount =
      c.hp := max 0 (!(c.hp) - amount)
  
    let attack_target attacker defender =
      let damage = attacker.attack + Random.int 10 in
      take_damage defender damage;
      Printf.printf "%s attacks %s for %d damage! (%s hp: %d)\n"
        attacker.name defender.name damage defender.name !(defender.hp)
  end
  
  let rec battle player enemy turn =
    if not (Character.is_alive player) then
      Printf.printf "\n%s has been defeated! game over.\n" player.Character.name
    else if not (Character.is_alive enemy) then
      Printf.printf "\n%s has been defeated! you win!\n" enemy.Character.name
    else begin
      Printf.printf "\n--- turn %d ---\n" turn;
      Character.attack_target player enemy;
      if Character.is_alive enemy then begin
        Character.attack_target enemy player;
        battle player enemy (turn + 1)
      end else
        battle player enemy (turn + 1)
    end
  
  let () =
    Random.self_init ();
    Printf.printf "=== mini rpg battle ===\n";
  
    Printf.printf "enter your character name: ";
    let player_name = read_line () in
    Printf.printf "enter your attack power (5-15): ";
    let player_attack = int_of_string (read_line ()) in
    let player = Character.create player_name 100 player_attack in
  
    let enemy = Character.create "goblin" 80 8 in
  
    Printf.printf "\n%s (hp: 100) vs %s (hp: 80)\n"
      player_name enemy.Character.name;
  
    battle player enemy 1
