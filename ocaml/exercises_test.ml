open Exercises;;

(* -------------------------------------------------------------------------- *)
let passes = ref 0;;
let failures = ref 0;;

let suite name = Printf.printf "\nTesting %s" name;;

let expect condition =
  if condition then
    (Printf.printf " .";
    passes := !passes + 1)
  else
    (Printf.printf " F";
    failures := !failures + 1);;
 (* -------------------------------------------------------------------------- *)

suite "change";;
match change (-50) with
  | exception Negative_Amount -> expect true
  | result -> expect false;;
expect (change 0 = [0; 0; 0; 0]);;
expect (change(1) = [0; 0; 0; 1]);;
expect (change(42) = [1; 1; 1; 2]);;
expect (change(99) = [3; 2; 0; 4]);;
expect (change(100000000037) = [4000000001; 1; 0; 2]);;
expect (change(10000000000005) = [400000000000; 0; 1; 0]);;

(* Uncomment the following tests as you complete the exercises *)

(*
let non_empty s = s <> "";;
let length_greater_than_3 s = String.length s > 3;;
let lower s = Some (String.lowercase_ascii s);;
let square n = Some(n * n);;

suite "first_then_apply";;
expect (first_then_apply [] non_empty lower = None);;
expect (first_then_apply [""; "A"; "B"] non_empty lower = Some "a");;
expect (first_then_apply [""; "A"; "ABC"] length_greater_than_3 lower = None);;
expect (first_then_apply ["ABC"; "ABCD"; "ABCDE"] length_greater_than_3 lower = Some "abcd");;
expect (first_then_apply [1; 2; 3] (fun n -> n > 1) square = Some 4);;
expect (first_then_apply [1; 2; 3] (fun n -> n > 3) square = None);;
*)

Printf.printf "\n%d passed, %d failed\n" !passes !failures;;
