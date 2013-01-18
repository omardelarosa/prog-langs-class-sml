fun is_less (first:int,second:int)=
    if first < second
    then true
    else false

fun is_older (d1 : int * int * int, d2 : int * int * int) =
    if is_less((#1 d1),(#1 d2))
    then true
    else if is_less((#1 d1),(#1 d2)) andalso is_less((#2 d1),(#2 d2))
    then true 
    else if is_less((#1 d1),(#1 d2))  andalso is_less((#2 d1),(#2 d2)) andalso is_less((#3 d1),(#3 d2))
    then true
    else false

(* consider revising using recursive loop that scans and saves value to is_less result to variable instead of rechecking it in each clause *)

