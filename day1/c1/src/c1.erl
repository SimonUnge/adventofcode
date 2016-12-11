-module(c1).

%% API exports
-export([walk/1, 
         distance/1, 
         last_pos/1, 
         visited_pos/1, 
         first_visited_twice/1]).

%%====================================================================
%% API functions
%%====================================================================

last_pos(S) ->
    {Pos,_} = walk(S),
    Pos.

visited_pos(S) ->
    {_, VisitedPos} = walk(S),
    VisitedPos.

walk(S) ->
    Tokens = string:tokens(S, ", "),
    walk({0,0}, Tokens, north, [{0,0}]).

distance({X,Y}) ->
    abs(X) + abs(Y).

first_visited_twice(S) ->
    VP = visited_pos(S),
    first_visited_twice(VP,[]).

first_visited_twice([],_PrevVP) ->
    false;
first_visited_twice([H|T],PrevVP) ->
    case lists:member(H, PrevVP) of
        true ->
            H;
        false ->
            first_visited_twice(T, [H|PrevVP])
    end.
    

%%====================================================================
%% Internal functions
%%====================================================================
get_range_of_pos_pos({X,XSteps},{Y, YSteps}) -> 
    tl([{Xs,Ys} || Xs <- lists:seq(X,X+XSteps), Ys <- lists:seq(Y,Y+YSteps)]).
get_range_of_neq_pos({X,XSteps},{Y, YSteps}) -> 
    tl(lists:reverse([{Xs,Ys} || Xs <- lists:seq(X-XSteps,X), Ys <- lists:seq(Y-YSteps,Y)])).

walk({X,Y}, [[$R|Steps]|T], Direction, VisitedPos) ->
    IntSteps = list_to_integer(Steps),
    case Direction of
        north ->
            Pos = {X+IntSteps, Y},
            walk(Pos, T, east, 
                 get_range_of_pos_pos({X,IntSteps},{Y, 0})++VisitedPos);
        east ->
            Pos = {X, Y-IntSteps},
            walk(Pos, T, south, 
                 get_range_of_neq_pos({X,0},{Y, IntSteps})++VisitedPos);
        south ->
            Pos = {X-IntSteps, Y},
            walk(Pos, T, west, 
                 get_range_of_neq_pos({X,IntSteps},{Y, 0})++VisitedPos);
        west ->
            Pos = {X, Y+IntSteps},
            walk(Pos, T, north, 
                 get_range_of_pos_pos({X,0},{Y, IntSteps})++VisitedPos)
    end;
walk({X,Y}, [[$L|Steps]|T], Direction, VisitedPos) ->
    IntSteps = list_to_integer(Steps),
    case Direction of
        north ->
            Pos = {X-IntSteps, Y},
            walk(Pos, T, west, 
                 get_range_of_neq_pos({X,IntSteps},{Y, 0})++VisitedPos);
        east ->
            Pos = {X, Y+IntSteps},
            walk(Pos, T, north, 
                 get_range_of_pos_pos({X,0},{Y, IntSteps})++VisitedPos);
        south ->
            Pos = {X+IntSteps, Y},
            walk(Pos, T, east, 
                 get_range_of_pos_pos({X,IntSteps},{Y, 0})++VisitedPos);
        west ->
            Pos = {X, Y-IntSteps},
            walk(Pos, T, south, 
                 get_range_of_neq_pos({X,0},{Y, IntSteps})++VisitedPos)
    end;
walk(Pos, [_Shit|T], Direction, VisitedPos) ->
    walk(Pos, T, Direction, VisitedPos);
walk(Pos, [], _Direction, VisitedPos) ->
    {Pos, lists:reverse(VisitedPos)}.
