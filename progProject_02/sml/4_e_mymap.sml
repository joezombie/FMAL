fun mymap f [] = nil
|	mymap f (a::at) =
		(f a)::(mymap f at);