fun zip [] b = nil
|   zip a [] = nil    
|   zip a b = (hd a, hd b)::(zip (tl a) (tl b));
