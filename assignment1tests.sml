use "assignment1.sml";

val date1 = (2012,3,4);
val date2 = (2011,3,4);
val date3 = (1999,1,5);
val date4 = (2025,10,7);

val datelist1 = [(3,3,4),(1,3,5),(1,3,2),(1,2,4)];
val datelist2 = [(3,2,4),(1,3,5),(1,1,2),(1,2,4)];
val datelist3 = [(3,1,4)];
val datelist4 = [(3,3,4)];

val monthlist1 = [3,2];
val monthlist2 = [3,1];
val monthlist3 = [1,6];

(* check problem 1 *)

is_older(date1,date2); (* should be false *)
is_older(date1,date3); (* should be false*)
is_older(date3,date1);  (* should be true *)

(* check problem 2 *)

number_in_month(datelist1,3); (* should be 3 *)
number_in_month(datelist2,3);  (* should be 1 *)
number_in_month(datelist3,3); (* should be 0 *)
number_in_month(datelist4,3); (* should be 1 *)

(* check problem 3 *)

number_in_months(datelist1,monthlist1); (* should be 4 *)
number_in_months(datelist1,monthlist2); (* should be 3*) 
number_in_months(datelist2,monthlist3); (* should be 1 *)
number_in_months(datelist1,monthlist3); (* should be 0 *)

