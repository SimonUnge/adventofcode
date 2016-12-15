-module(day5).

%% API exports
-export([get_code/1,
        get_code2/1]).

%%====================================================================
%% API functions
%%====================================================================

get_code(DoorID) ->
    get_code(DoorID, 0, []).

get_code2(DoorID) ->
    get_code(DoorID, 0, []).

%%====================================================================
%% Internal functions
%%====================================================================

get_code(_DoorID, _Index, Code) when length(Code) == 8 ->
    lists:reverse(Code);
get_code(DoorID, Index, Code) ->
    {Zeros, Rest} =
        lists:split(5,
                    str_to_md5_hex(DoorID, Index)),
    NewCode = if 
                  "00000" == Zeros ->        
                      [hd(Rest)|Code];
                  true ->
                      Code
              end,
    get_code(DoorID, Index+1, NewCode).

str_to_md5_hex(DoorID, Index) ->
    [begin 
         if N < 10 -> 48 + N; 
            true -> 87 + N 
         end 
     end || <<N:4>> <= erlang:md5(DoorID ++ integer_to_list(Index))].
