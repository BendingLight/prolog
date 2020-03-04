% Family relationship tree- Prolog

% parent facts
parent('pam','bob').
parent('tom','bob').
parent('tom','liz').
parent('bob','ann').
parent('bob','pal').
parent('pal','jim').
parent('jim','tim').

% gender facts

male('bob').
male('tom').
male('jim').
female('pam').
female('liz').
female('ann').
female('pal').

% father-mother rule
father(X,Y):-   parent(X,Y),male(X).
mother(X,Y):-   parent(X,Y),female(X).

% brother-sister rule
brother(X,Y):-  parent(Z,X),parent(Z,Y),male(X),X\==Y.
sister(X,Y):-   parent(Z,X),parent(Z,Y),female(X),X\==Y.

% ancestor rule
ancestor(X,Y):- parent(X,Y).
ancestor(X,Y):- parent(X,Y1),parent(Y1,Y).

% List rule
list_head([H|_]):-write('Head: '),write(H).         % list_head([1,2,3,4])          =>  1

list_tail([H|[]]):-write('Tail: '),write(H).        % list_tail([1,2,3,4])          =>  4
list_tail([_|T]):-list_tail(T).

list_member(X,[X|_]):-write('found').               % list_member(2,[1,2,3])        =>  found
list_member(X,[_|L]):-list_member(X,L).

list_len([],0,0).
list_len([_|T],N,M):-list_len(T,N1,N2), N is N1+1, M is N2 + 2.

list_concat([],L,L).
list_concat([H|T],L,[H|T1]):-list_concat(T,L,T1).