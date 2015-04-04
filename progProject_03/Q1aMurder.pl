affair(steve, jane).
affair(jane, steve).
affair(steve, mary).
affair(mary, steve).
married(tom, jane).
married(jane, tom).
rich(steve).
greedy(john).
hates(L, M) :- married(L, N), affair(M, N).
envies(L, M) :- greedy(L),not(rich(L)),rich(M).
suspect(L, M) :- hates(L, M);envies(L, M).