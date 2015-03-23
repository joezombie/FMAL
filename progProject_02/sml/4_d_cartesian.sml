fun cartesian [] _ = nil
|	cartesian _ [] = nil
|	cartesian [a] (b::bt) = (a, b)::(cartesian [a] bt)
| 	cartesian (a::at) b =
		(cartesian [a] b)@(cartesian at b);