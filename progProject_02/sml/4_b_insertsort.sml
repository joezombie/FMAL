fun insert (x:real, []) = [x]
|	insert (x:real, a::at) =
		if x > a then a::insert(x, at) else x::a::at;

fun insertsort [] = []
|	insertsort (a::at) =
		insert(a, insertsort at)
		