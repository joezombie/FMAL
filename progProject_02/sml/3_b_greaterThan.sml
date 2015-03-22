fun greaterThan [] k = nil
|	greaterThan (a::at) k =
		if a > k 
		then a::(greaterThan at k) 
		else greaterThan at k;