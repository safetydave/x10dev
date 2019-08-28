% Shokunin August 2019
% David Colls

% Utility methods

permutation([],[]).
permutation(L, [H|T]) :-
  append(V, [H|U], L),
  append(V, U, W), permutation(W, T).

last(X, [X]).
last(X, [_|Z]) :- last(X, Z).

precedes(X, Y, [X|T]) :- member(Y, T).
precedes(X, Y, [_|T]) :- precedes(X, Y, T).

adjacent(X, Y, [X|[Y|_]]).
adjacent(X, Y, [Y|[X|_]]).
adjacent(X, Y, [_|T]) :- adjacent(X, Y, T).

% Here's what we know:
% Jessie is not the best developer
% Evan is not the worst developer
% John is not the best developer or the worst developer
% Sarah is a better developer than Evan
% Matt is not directly below or above John as a developer
% John is not directly below or above Evan as a developer

invalid(['Jessie'|_]).
invalid(X) :- last('Evan', X).
invalid(['John'|_]).
invalid(X) :- last('John', X).
invalid(X) :- precedes('Evan', 'Sarah', X).
invalid(X) :- adjacent('Matt', 'John', X).
invalid(X) :- adjacent('John', 'Evan', X).

% Answers to challenge questions

devrank(X) :-
  permutation(['Jessie', 'Evan', 'John', 'Sarah', 'Matt'], X),
  \+ invalid(X).

x10dev(X) :- devrank([X|_]).
