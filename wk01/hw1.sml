 (* Problem 1 *)
fun is_older (date1 : int * int * int, date2 : int * int * int) = 
	#1 date1 < #1 date2 orelse (#1 date1 = #1 date2 andalso #2 date1 < #2 date2) orelse (#2 date1 = #2 date2 andalso #3 date1 < #3 date2 )

(* Problem 2 *)
fun number_in_month (dates: (int * int * int) list, month: int) = 
	if null dates
	then 0
	else if #2 (hd dates) = month
		then 1 + number_in_month(tl dates, month)
		else number_in_month(tl dates, month)

(* Problem 3 *)
fun number_in_months (dates: (int * int * int) list, months: int list) = 
	if null months
	then 0
	else number_in_month(dates, (hd months)) + number_in_months(dates, (tl months))

(* Problem 4 *)
fun dates_in_month (dates: (int * int * int) list, month: int) = 
	if null dates
	then []
	else if number_in_month([hd dates], month) = 1
		then (hd dates) :: dates_in_month((tl dates), month)
		else dates_in_month((tl dates), month)

(* Problem 5 *)
fun dates_in_months (dates: (int * int * int) list, months: int list) = 
	if null months
	then []
	else dates_in_month(dates, (hd months)) @ dates_in_months(dates, (tl months))

(* Problem 6 *)
fun get_nth (strings: string list, n: int) =
	if n <= 1
	then hd strings
	else get_nth((tl strings), n-1)

(* Problem 7 *)
val months = ["January","February","March","April","May","June","July","August","September","October","November","December"]
val month_nums = [31,28,31,30,31,30,31,31,30,31,30,31]

fun date_to_string(date : (int * int * int)) =
	get_nth(months,(#2 date)) ^ " " ^ (Int.toString (#3 date)) ^ ", " ^ (Int.toString (#1 date))

(* Problem 8 *)
fun number_before_reaching_sum (sum: int, numbers: int list) =
	if sum <= (hd numbers)
	then 0
	else 1 + number_before_reaching_sum(sum, ((hd numbers) + (hd (tl numbers))) :: (tl (tl numbers)) ) 

(* Problem 9 *)
fun what_month (day_of_year: int) =
	if day_of_year > 0 andalso day_of_year <= 365 
	then 1 + number_before_reaching_sum(day_of_year,month_nums)
	else 0

(* Problem 10 *)
fun month_range(day1 : int, day2: int) =
	let fun range(first: int, second: int) =
			if first > second
			then []
			else first :: range(first+1,second)
		val days_range = range(day1,day2)
	in 	if null days_range
		then []
		else what_month(hd days_range) :: month_range(day1+1,day2)
	end

(* Problem 11 *)

fun oldest (dates: (int * int * int) list) =
	if null dates
	then NONE
	else let 
			fun oldest_nonempty(dates: (int * int * int) list) =
		 		if null (tl dates)
		 		then hd dates
		 		else let val tl_ans = oldest_nonempty(tl dates)
		 			 in
		 			 	if is_older(hd dates,tl_ans)
		 			 	then hd dates
		 			 	else tl_ans
		 			 end
		  in
		  	SOME (oldest_nonempty(dates))
		  end
			 

(* Challenge Problem 12 *)

(* Problem 12 Helper Functions *)

fun unique_nums (old_nums: int list, new_nums: int list) =
	let fun is_in_list(nums: int list, num: int) =
			if null nums
			then false
			else if num = hd nums 
				 then true
				 else is_in_list(tl nums,num)
	in if null old_nums
	   then new_nums
	   else if not (is_in_list(new_nums,hd old_nums))
	    	then unique_nums(tl old_nums,(hd old_nums :: new_nums))
	    	else unique_nums(tl old_nums,(new_nums))
	end

fun unique_dates (old_dates: (int * int * int) list, new_dates: (int * int * int) list) =
			let fun is_in_list(dates: (int * int * int) list, date: (int * int * int)) =
					if null dates
					then false
					else if date = hd dates 
						 then true
						 else is_in_list(tl dates,date)
			in if null old_dates
			   then new_dates
			   else if not (is_in_list(new_dates,hd old_dates))
			    	then unique_dates(tl old_dates,(hd old_dates :: new_dates))
			    	else unique_dates(tl old_dates,(new_dates))
			end

(* Challenge Problem 12 *)

fun number_in_months_challenge (dates: (int * int * int) list, months: int list) =
	let
		val dates = unique_dates(dates,[])
		val months = unique_nums(months,[])
	in 
		if null months
		then 0
		else number_in_month(dates, (hd months)) + number_in_months(dates, (tl months))
	end

fun dates_in_months_challenge (dates: (int * int * int) list, months: int list) = 
	let 
		val dates = unique_dates(dates,[])
		val months = unique_nums(months,[])
	in if null months
		then []
		else dates_in_month(dates, (hd months)) @ dates_in_months(dates, (tl months))
	end

(* Challenge Problem 13 *)

fun reasonable_date (date : int * int * int) =
	let val leap_year_month_nums = [31,29,31,30,31,30,31,31,30,31,30,31]
		fun is_leap_year(year: int) =
			year mod 400 = 0 orelse (year mod 4 = 0 andalso (not (year mod 100 = 0)))
		fun get_nth_element (day_nums_list: int list, n: int) =
			if n <= 1
			then hd day_nums_list
			else get_nth_element((tl day_nums_list), n-1)
		fun is_day_valid(month_num: int, day_num: int) =
			let val max_day = if is_leap_year(#1 date) then get_nth_element(leap_year_month_nums, month_num) else get_nth_element(month_nums, month_num)
			in day_num > 0 andalso day_num <= max_day
			end
	in (#1 date) > 0 andalso (#2 date) > 0 andalso (#2 date) <= 12 andalso is_day_valid((#2 date),(#3 date))
	end

