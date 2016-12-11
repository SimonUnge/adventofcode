-module(day3).

%% API exports
-export([valid_triangle/1,
         file_to_list_of_rectangles/1, transform_from_vertical/1]).

%%====================================================================
%% API functions
%%====================================================================
valid_triangle([X,Y,Z]) when X+Y > Z andalso
                             X+Z > Y andalso
                             Z+Y > X ->
    true;
valid_triangle(_) ->
    false.

file_to_list_of_rectangles(File) ->
    {ok, B} = file:read_file(File),
    PerLine = string:tokens(binary_to_list(B), "\n"),
    lists:map(fun(X) -> 
                      lists:map(fun(Y) ->
                                        list_to_integer(Y)
                                end, string:tokens(X, " "))
              end, PerLine).

transform_from_vertical(List) ->
    transform_from_vertical(List,[]).
transform_from_vertical([[A1,A2,A3],[B1,B2,B3],[C1,C2,C3]|T], Acc) ->
    transform_from_vertical(T,[[A1,B1,C1],[A2,B2,C2],[A3,B3,C3]|Acc]);
transform_from_vertical([], Acc) ->
    Acc.

%%====================================================================
%% Internal functions
%%====================================================================
