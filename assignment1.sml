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


fun number_in_month (datelist : (int * int * int) list, x : int) = 
    if x > 2
    then hd datelist   (* testing validity of types only*)
    else hd (tl datelist)


(*
fun is_older_list (d1 : (int * int * int) list, d2 : (int * int * int) list) =
    if is_less(val(hd d1),val(hd d2))
    then true
    else false 
*)

(* 1. consider revising using recursion that scans and saves value to is_less result to variable instead of rechecking it in each clause 
   2. add date-validity checking to the is_less function somehow.
*)

