(* problem 1 *)

fun is_older (d1 : int * int * int, d2 : int * int * int) =
    let
	fun is_less (first:int,second:int)=
	    if first < second
	    then true
	    else false
    in
	if is_less((#1 d1),(#1 d2))
	then true
	else if is_less((#1 d1),(#1 d2)) andalso is_less((#2 d1),(#2 d2))
	then true 
	else if is_less((#1 d1),(#1 d2))  andalso is_less((#2 d1),(#2 d2)) andalso is_less((#3 d1),(#3 d2))
	then true
	else false
    end
(* problem 2 *)

fun number_in_month (dates : (int * int * int) list, month : int) = 
    let val total = 0
	val m1 = #2 (hd dates)
	val nextdate = tl dates
    in 
	if m1 = month andalso null nextdate
	then 1
	else if null nextdate
        then total
        else if m1 = month
	    then total + 1 + number_in_month(nextdate,month)
	    else total + number_in_month(nextdate,month)
    end

fun number_in_months (dates : (int * int * int) list, months : int list) =
    let val datestotal = 0
	val currentmonth = number_in_month(dates,(hd months))
	val nextmonth = number_in_month(dates,(hd (tl months)))
    in if null months
       then datestotal
       else if currentmonth  > 0
       then datestotal + (1 * currentmonth) + nextmonth 
       else datestotal + nextmonth
    end
