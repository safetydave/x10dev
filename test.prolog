% Evidence of TDD
% Recreated by CSI team from eyewitness reports of interactive session

% Utility functions

% precedes scenarios
precedes_should_pass_base :-
  precedes('Alice', 'Bob', ['Alice', 'Bob']).
precedes_should_fail_base :-
  \+ precedes('Alice', 'Bob', ['Bob', 'Alice']).
precedes_should_pass_recursive_1 :-
  precedes('Alice', 'Bob', ['Darren', 'Alice', 'Charlie', 'Bob']).
precedes_should_fail_recursive_1 :-
  \+ precedes('Alice', 'Bob', ['Darren', 'Bob', 'Charlie', 'Alice']).

precedes_all_tests :-
  precedes_should_pass_base,
  precedes_should_fail_base,
  precedes_should_pass_recursive_1,
  precedes_should_fail_recursive_1.

% Iterative solution testing
invalid_should_pass_jessie_first_isolation :-
  invalid(['Jessie', 'Sarah']).
invalid_should_fail_jessie_not_first_isolation :-
  \+ invalid(['Sarah', 'Jessie']).

invalid_jessie_all_tests :-
  invalid_should_pass_jessie_first_isolation,
  invalid_should_fail_jessie_not_first_isolation.

