% ============================================================
%  Family Tree Knowledge Base (The Simpsons)
% ============================================================

% ---- Facts: male / female ----
male(abraham).
male(clancy).
male(herb).
male(homer).
male(bart).

female(mona).
female(jackie).
female(marge).
female(patty).
female(selma).
female(lisa).
female(maggie).
female(ling).

% ---- Facts: parent ----
parent(abraham, herb).
parent(mona, herb).
parent(abraham, homer).
parent(mona, homer).

parent(clancy, marge).
parent(jackie, marge).
parent(clancy, patty).
parent(jackie, patty).
parent(clancy, selma).
parent(jackie, selma).

parent(homer, bart).
parent(marge, bart).
parent(homer, lisa).
parent(marge, lisa).
parent(homer, maggie).
parent(marge, maggie).

parent(selma, ling).

% ============================================================
%  Rules
% ============================================================

father(F, C) :- parent(F, C), male(F).

mother(M, C) :- parent(M, C), female(M).

son(S, P) :- parent(P, S), male(S).

daughter(D, P) :- parent(P, D), female(D).

sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.

brother(B, P) :- sibling(B, P), male(B).

sister(S, P) :- sibling(S, P), female(S).

grandfather(G, C) :- parent(G, P), parent(P, C), male(G).

grandmother(G, C) :- parent(G, P), parent(P, C), female(G).

aunt(A, C) :- parent(P, C), sister(A, P).

uncle(U, C) :- parent(P, C), brother(U, P).

cousin(C1, C2) :- parent(P1, C1), parent(P2, C2), sibling(P1, P2).

% Rule 1 - the simple case
ancestor(X, Y) :- parent(X, Y).
% Rule 2 - the recursive case
ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).