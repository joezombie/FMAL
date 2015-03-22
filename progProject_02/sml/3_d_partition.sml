fun partition f [] = ([], [])
|   partition f (a::at) =
        let
             val (M, N) = partition f at
         in
             if f(a) then (a::M, N) else (M, a::N)
         end;
