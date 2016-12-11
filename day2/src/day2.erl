-module(day2).

%% API exports
-export([get_code/1, get_code/2]).
-export([get_code2/1, get_code2/2]).

%%====================================================================
%% API functions
%%====================================================================

get_code([]) ->
    none;
get_code(Input) ->
    get_code(Input, 5).

%%====================================================================
%% Internal functions
%%====================================================================

% Start 1
get_code([$L|T], 1) ->
    get_code(T, 1);
get_code([$R|T], 1) ->
    get_code(T, 2);
get_code([$U|T], 1) ->
    get_code(T, 1);
get_code([$D|T], 1) ->
    get_code(T, 4);
% Start 2
get_code([$L|T], 2) ->
    get_code(T, 1);
get_code([$R|T], 2) ->
    get_code(T, 3);
get_code([$U|T], 2) ->
    get_code(T, 2);
get_code([$D|T], 2) ->
    get_code(T, 5);
% Start 3
get_code([$L|T], 3) ->
    get_code(T, 2);
get_code([$R|T], 3) ->
    get_code(T, 3);
get_code([$U|T], 3) ->
    get_code(T, 3);
get_code([$D|T], 3) ->
    get_code(T, 6);
% Start 4
get_code([$L|T], 4) ->
    get_code(T, 4);
get_code([$R|T], 4) ->
    get_code(T, 5);
get_code([$U|T], 4) ->
    get_code(T, 1);
get_code([$D|T], 4) ->
    get_code(T, 7);
% Start 5
get_code([$L|T], 5) ->
    get_code(T, 4);
get_code([$R|T], 5) ->
    get_code(T, 6);
get_code([$U|T], 5) ->
    get_code(T, 2);
get_code([$D|T], 5) ->
    get_code(T, 8);
% Start 6
get_code([$L|T], 6) ->
    get_code(T, 5);
get_code([$R|T], 6) ->
    get_code(T, 6);
get_code([$U|T], 6) ->
    get_code(T, 3);
get_code([$D|T], 6) ->
    get_code(T, 9);
% Start 7
get_code([$L|T], 7) ->
    get_code(T, 7);
get_code([$R|T], 7) ->
    get_code(T, 8);
get_code([$U|T], 7) ->
    get_code(T, 4);
get_code([$D|T], 7) ->
    get_code(T, 7);
% Start 8
get_code([$L|T], 8) ->
    get_code(T, 7);
get_code([$R|T], 8) ->
    get_code(T, 9);
get_code([$U|T], 8) ->
    get_code(T, 5);
get_code([$D|T], 8) ->
    get_code(T, 8);
% Start 9
get_code([$L|T], 9) ->
    get_code(T, 8);
get_code([$R|T], 9) ->
    get_code(T, 9);
get_code([$U|T], 9) ->
    get_code(T, 6);
get_code([$D|T], 9) ->
    get_code(T, 9);

get_code([],Current) ->
    Current.

get_code2([$L|T]) ->
    get_code2(T, 5).
% Start 1
get_code2([$L|T], 1) ->
    get_code2(T, 1);
get_code2([$R|T], 1) ->
    get_code2(T, 1);
get_code2([$U|T], 1) ->
    get_code2(T, 1);
get_code2([$D|T], 1) ->
    get_code2(T, 3);
% Start 2
get_code2([$L|T], 2) ->
    get_code2(T, 2);
get_code2([$R|T], 2) ->
    get_code2(T, 3);
get_code2([$U|T], 2) ->
    get_code2(T, 2);
get_code2([$D|T], 2) ->
    get_code2(T, 6);
% Start 3
get_code2([$L|T], 3) ->
    get_code2(T, 2);
get_code2([$R|T], 3) ->
    get_code2(T, 4);
get_code2([$U|T], 3) ->
    get_code2(T, 1);
get_code2([$D|T], 3) ->
    get_code2(T, 7);
% Start 4
get_code2([$L|T], 4) ->
    get_code2(T, 3);
get_code2([$R|T], 4) ->
    get_code2(T, 4);
get_code2([$U|T], 4) ->
    get_code2(T, 4);
get_code2([$D|T], 4) ->
    get_code2(T, 8);
% Start 5
get_code2([$L|T], 5) ->
    get_code2(T, 5);
get_code2([$R|T], 5) ->
    get_code2(T, 6);
get_code2([$U|T], 5) ->
    get_code2(T, 5);
get_code2([$D|T], 5) ->
    get_code2(T, 5);
% Start 6
get_code2([$L|T], 6) ->
    get_code2(T, 5);
get_code2([$R|T], 6) ->
    get_code2(T, 7);
get_code2([$U|T], 6) ->
    get_code2(T, 2);
get_code2([$D|T], 6) ->
    get_code2(T, a);
% Start 7
get_code2([$L|T], 7) ->
    get_code2(T, 6);
get_code2([$R|T], 7) ->
    get_code2(T, 8);
get_code2([$U|T], 7) ->
    get_code2(T, 3);
get_code2([$D|T], 7) ->
    get_code2(T, b);
% Start 8
get_code2([$L|T], 8) ->
    get_code2(T, 7);
get_code2([$R|T], 8) ->
    get_code2(T, 9);
get_code2([$U|T], 8) ->
    get_code2(T, 4);
get_code2([$D|T], 8) ->
    get_code2(T, c);
% Start 9
get_code2([$L|T], 9) ->
    get_code2(T, 8);
get_code2([$R|T], 9) ->
    get_code2(T, 9);
get_code2([$U|T], 9) ->
    get_code2(T, 9);
get_code2([$D|T], 9) ->
    get_code2(T, 9);
% Start a
get_code2([$L|T], a) ->
    get_code2(T, a);
get_code2([$R|T], a) ->
    get_code2(T, b);
get_code2([$U|T], a) ->
    get_code2(T, 6);
get_code2([$D|T], a) ->
    get_code2(T, a);
% Start b
get_code2([$L|T], b) ->
    get_code2(T, a);
get_code2([$R|T], b) ->
    get_code2(T, c);
get_code2([$U|T], b) ->
    get_code2(T, 7);
get_code2([$D|T], b) ->
    get_code2(T, d);
% Start c
get_code2([$L|T], c) ->
    get_code2(T, b);
get_code2([$R|T], c) ->
    get_code2(T, c);
get_code2([$U|T], c) ->
    get_code2(T, 8);
get_code2([$D|T], c) ->
    get_code2(T, c);
% Start d
get_code2([$L|T], d) ->
    get_code2(T, d);
get_code2([$R|T], d) ->
    get_code2(T, d);
get_code2([$U|T], d) ->
    get_code2(T, b);
get_code2([$D|T], d) ->
    get_code2(T, d);
get_code2([],Current) ->
    Current.

