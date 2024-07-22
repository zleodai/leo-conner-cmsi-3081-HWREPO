open Exercises;;

Printf.printf "Testing change()\n";;

assert (change 0 = [0; 0; 0; 0]);;
match change (-50) with
  | exception Negative_Amount -> assert true
  | result -> assert false;;
assert (change(1) = [0; 0; 0; 1]);;
assert (change(99) = [3; 2; 0; 4]);;
assert (change(42) = [1; 1; 1; 2]);;
assert (change(100000000037) = [4000000001; 1; 0; 2]);;
assert (change(10000000000005) = [400000000000; 0; 1; 0]);;

Printf.printf "All tests pass\n"
