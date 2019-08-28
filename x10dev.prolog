% Shokunin August 2019
% David Colls

% Imports

use_module(library(lists)).

% Utility methods

precedes(X, Y, [X|T]) :- member(Y, T).
precedes(X, Y, [_|T]) :- precedes(X, Y, T).

adjacent(X, Y, L) :- nextto(X, Y, L); nextto(Y, X, L).

% Here's what we know:
% Jessie is not the best developer
% Evan is not the worst developer
% John is not the best developer or the worst developer
% Sarah is a better developer than Evan
% Matt is not directly below or above John as a developer
% John is not directly below or above Evan as a developer

invalid(X) :-
  X = ['Jessie'|_];
  last(X, 'Evan');
  X = ['John'|_]; last(X, 'John');
  precedes('Evan', 'Sarah', X);
  adjacent('Matt', 'John', X);
  adjacent('John', 'Evan', X).

% Answers to challenge questions

devrank(X) :-
  permutation(['Jessie', 'Evan', 'John', 'Sarah', 'Matt'], X),
  \+ invalid(X).

x10dev(X) :- devrank([X|_]).
