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
