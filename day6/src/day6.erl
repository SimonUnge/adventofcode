-module(day6).

%% API exports
-export([decode_most_common/1,
         decode_least_common/1]).

%%====================================================================
%% API functions
%%====================================================================

decode_most_common(Input) ->
    M = file_to_list(Input),
    TM = transpose(M),
    lists:map(fun(X) ->
                      R = list_of_char_count(X),
                      {C,_} = hd(lists:reverse(lists:keysort(2,R))),
                      C
              end, TM).

decode_least_common(Input) ->
    M = file_to_list(Input),
    TM = transpose(M),
    lists:map(fun(X) ->
                      R = list_of_char_count(X),
                      {C,_} = hd(lists:keysort(2,R)),
                      C
              end, TM).
%%====================================================================
%% Internal functions
%%====================================================================

transpose([[]|_]) -> [];
transpose(M) ->
  [lists:map(fun hd/1, M) | transpose(lists:map(fun tl/1, M))].

file_to_list(File) ->
    {ok, B} = file:read_file(File),
    string:tokens(binary_to_list(B), "\n").

list_of_char_count(M) ->
    list_of_char_count(M, []).

list_of_char_count([C|T], PLAcc) ->
    case lists:keytake(C, 1, PLAcc) of
        false ->
            list_of_char_count(T, [{C,1}|PLAcc]);
        {value, {C, Count}, NewPL} ->
            list_of_char_count(T, [{C,Count+1}|NewPL])
    end;
list_of_char_count([], PL) ->
    PL.
