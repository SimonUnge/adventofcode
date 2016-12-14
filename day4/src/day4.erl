-module(day4).

%% API exports
-export([sum_of_real_room_sector_ids/1,
         rshift_n_times/2]).

%%====================================================================
%% API functions
%%====================================================================
rshift_n_times(C,N) when C+N > 122 ->
    (((C+N)-122) rem 26) + 96;
rshift_n_times(C,N) ->
    C+N.

sum_of_real_room_sector_ids(Input) ->
    Rooms = file_to_list(Input),
    ValidRooms = lists:filter(fun valid_room/1, Rooms),
    lists:sum(
      lists:map(fun(X) -> 
                        {match,[E]} = re:run(X, 
                                             "(\\d){1,9}", 
                                             [{capture, first, list}]), 
                        list_to_integer(E) end, ValidRooms)).



%%====================================================================
%% Internal functions
%%====================================================================

valid_room(L) ->
    [EncryptName, Hash] = re:split(L,
                                   "-[0-9]*[\[]",
                                   [{return,list}]),
    HashClean = lists:reverse(tl(lists:reverse(Hash))),
    PropL = plist_of_char_count(EncryptName, []),
    NL = lists:sort(fun({Key1,V1},{Key2,V2}) -> 
                            case V1 == V2 of true -> 
                                    Key1 =< Key2; 
                                _ -> V1 >= V2  
                            end 
                    end , PropL),
    {[{C1,_},{C2,_},{C3,_},{C4,_},{C5,_}], _} = lists:split(5, NL),
    [C1,C2,C3,C4,C5] == HashClean.

file_to_list(File) ->
    {ok, B} = file:read_file(File),
    string:tokens(binary_to_list(B), "\n").

plist_of_char_count([$-|T], PLAcc) ->
    plist_of_char_count(T, PLAcc);
plist_of_char_count([C|T], PLAcc) ->
    case lists:keytake(C, 1, PLAcc) of
        false ->
            plist_of_char_count(T, [{C,1}|PLAcc]);
        {value, {C, Count}, NewPL} ->
            plist_of_char_count(T, [{C,Count+1}|NewPL])
    end;
plist_of_char_count([], PL) ->
    PL.
