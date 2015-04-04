/*
Programming Project 3
Jóhannes Gunnar Heiðarsson (JohannesH10@ru.is)
*/

% 1.a
affair(steve, jane).
affair(jane, steve).
affair(steve, mary).
affair(mary, steve).
married(tom, jane).
married(jane, tom).
rich(steve).
greedy(john).
hates(L, M):- married(L, N), affair(M, N).
envies(L, M):- greedy(L),not(rich(L)),rich(M).
suspect(L, M):- hates(L, M);envies(L, M).

% 1.b
/*
The suspects are Tom and John.

?- suspect(L, steve).
L = tom ;
L = john ;
*/

% 1.c
/*
If John was rich there would be only one suspect.

rich(john).
*/

% 2.a
numElements(N, []):- N = 0.
numElements(N,[_|Y]):- numElements(C,Y), N is 1 + C.

% 2.b
removeElement(X, [X|L1t], L1t).
removeElement(X, [L1h|L1t], [L1h|L2]):- removeElement(X, L1t, L2).

% 2.c
insertElementAt(X, L1, 1, [X|L1]).
insertElementAt(X, [L1h|L1t], Pos, [L1h|L2]):- C is Pos -1,insertElementAt(X, L1t, C, L2).

% 2.d
segmentHelper([], []):- !.
segmentHelper([], [_|_]):- !.
segmentHelper([X|L1t], [X|L2t]):- !, segmentHelper(L1t, L2t).
segment([], []):- !.
segment([], [_|_]):- !.
segment([X|L1t], [X|L2t]):- segmentHelper(L1t, L2t), !.
segment(L1, [_|L2t]):- segment(L1, L2t).

% 2.e
addUpListHelper([], [Acc], Acc).
addUpListHelper([L1h|L1t], [Acc|L2t], Acc):- X is Acc + L1h, addUpListHelper(L1t, L2t, X).
addUpList([], L2):- L2 = [].
addUpList([L1h|L1t], L2):- addUpListHelper(L1t, L2, L1h).

% 3.a
mymerge([], Y, Y).
mymerge(X, [], X).
mymerge([Xh|Xt], [Yh|Yt], [Zh|Zt]):- ( 
	Xh < Yh -> Zh = Xh, mymerge(Xt, [Yh|Yt], Zt) ; 
	Zh = Yh, mymerge([Xh|Xt], Yt, Zt)
	).

% 3.b
mysplit([], [], []).
mysplit([L1h|L1t], [L1h|L2], L3):- mysplit(L1t, L3, L2).

% 3.c
mymergesort([], [], []).
mymergesort([X], [], [X]).
mymergesort([], [Y], [Y]).
mymergesort([X], [Y], Z):- mymerge([X], [Y], Z).
mymergesort(X, Y, Z):- 
	mysplit(X, X1, X2), 
	mymergesort(X1, X2, X3), 
	mysplit(Y, Y1, Y2), 
	mymergesort(Y1, Y2, Y3), 
	mymerge(X3, Y3, Z).

mysort([], []).
mysort([X], [X]).
mysort(L1, L2):- mysplit(L1, X, Y), mymergesort(X, Y, L2).

% 4.a
binaryTree(nil).
binaryTree(t(_, nil, nil)).
binaryTree(t(_, T1, nil)):- binaryTree(T1).
binaryTree(t(_, nil, T2)):- binaryTree(T2).
binaryTree(t(_, T1, T2)):- binaryTree(T1), binaryTree(T2).

% 4.b
preorder(nil, []).
preorder(t(X, T1, T2), [X|Lis]):- preorder(T1, L1), preorder(T2, L2), append(L1, L2, Lis).

% 4.c
leaves(nil, []).
leaves(t(X, nil, nil), [X]).
leaves(t(_, T1, T2), Lis):- leaves(T1, L1), leaves(T2, L2), !, append(L1, L2, Lis).

% 5
lbracket(['('|L], L).
rbracket([')'|L], L).
star(['*'|L], L).
plus(['+'|L], L).

factor([F|L], L):- number(F).
factor(F, L):- lbracket(F, R), expr(R, R1), rbracket(R1, L).

term(T, L):- factor(T, L).
term(T, L):- factor(T, R), star(R, R1), term(R1, L).

expr(L):- expr(L, []).
expr(E, L):- term(E, L).
expr(E, L):- term(E, R1), plus(R1, R2), expr(R2, L).