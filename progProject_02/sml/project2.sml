fun zip [] b = nil
|   zip a [] = nil    
|   zip a b = (hd a, hd b)::(zip (tl a) (tl b));

fun greaterThan [] k = nil
|	greaterThan (a::at) k =
		if a > k 
		then a::(greaterThan at k) 
		else greaterThan at k;

fun reduction f [a] = a
|	reduction f (a::b::tl) = (reduction f (f(a, b)::tl));

fun partition f [] = ([], [])
|   partition f (a::at) =
        let
             val (M, N) = partition f at
         in
             if f(a) then (a::M, N) else (M, a::N)
         end;

fun insert (x:real, []) = [x]
|	insert (x:real, a::at) =
		if x > a then a::insert(x, at) else x::a::at;

fun insertsort [] = []
|	insertsort (a::at) =
		insert(a, insertsort at)

fun middle [a] = a
|	middle [_, b] = b
| 	middle (a::at) = 
		let
			fun removeLast [] = nil
			| 	removeLast [a] = nil
			|	removeLast (a::at) = a::removeLast at
		in
			middle (removeLast at)
		end;

fun cartesian [] _ = nil
|	cartesian _ [] = nil
|	cartesian [a] (b::bt) = (a, b)::(cartesian [a] bt)
| 	cartesian (a::at) b =
		(cartesian [a] b)@(cartesian at b);

fun mymap f [] = nil
|	mymap f (a::at) =
		(f a)::(mymap f at);

zip [1,2,3] ["a","b","c"];
zip [1,2] ["a"];
greaterThan [1,5,3,2,4] 3;
reduction op+ [1,3,5,7,9];
reduction op* [1,3,5,7,9];
partition Char.isLower [#"P",#"a",#"3",#"%",#"b"];
insert (3.3, [1.1, 2.2, 4.4, 5.5]);
insertsort [2.2, 4.4, 5.5, 3.3, 1.1];
middle [1,2,3,4,5];
middle [true, false];
cartesian ["a","b","c"] [1,2];
(mymap (fn x => x*x)) [1,2,3,4]