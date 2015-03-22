fun reduction f [a] = a
|	reduction f (a::b::tl) = (reduction f (f(a, b)::tl));