-module(c1_tests).

-include_lib("eunit/include/eunit.hrl").

no_walk_test() ->
    Input = "",
    ExpectedLastPos = {0,0},
    ?assertEqual(ExpectedLastPos, c1:last_pos(Input)).

walk_r1_test() ->
    Input = "R1",
    ExpectedLastPos = {1,0},
    ?assertEqual(ExpectedLastPos, c1:last_pos(Input)).

walk_r1_r1_test() ->
    Input = "R1, R1",
    ExpectedLastPos = {1,-1},
    ?assertEqual(ExpectedLastPos, c1:last_pos(Input)).

walk_r1_l1_test() ->
    Input = "R1, L1",
    ExpectedLastPos = {1,1},
    ?assertEqual(ExpectedLastPos, c1:last_pos(Input)).

walk_r2_l3_test() ->
    Input = "R2, L3",
    ExpectedLastPos = {2,3},
    ?assertEqual(ExpectedLastPos, c1:last_pos(Input)).

walk_r2_r2_r2_test() ->
    Input = "R2, R2, R2",
    ExpectedLastPos = {0,-2},
    ?assertEqual(ExpectedLastPos, c1:last_pos(Input)).

walk_r5_l5_test() ->
    Input = "R5, L5",
    ExpectedLastPos = {5,5},
    ?assertEqual(ExpectedLastPos, c1:last_pos(Input)).

walk_r5_l5_R5_test() ->
    Input = "R5, L5, R5",
    ExpectedLastPos = {10,5},
    ?assertEqual(ExpectedLastPos, c1:last_pos(Input)).

walk_r5_l5_r5_r3_test() ->
    Input = "R5, L5, R5, R3",
    ExpectedLastPos = {10,2},
    ?assertEqual(ExpectedLastPos, c1:last_pos(Input)).

dist_r2_l3_test() ->
    Input = "R2, L3",
    ExpectedDist = 5,
    ?assertEqual(ExpectedDist, c1:distance(c1:last_pos(Input))).

dist_r2_r2_r2_test() ->
    Input = "R2, R2, R2",
    ExpectedDist = 2,
    ?assertEqual(false, c1:first_visited_twice(Input)),
    ?assertEqual(ExpectedDist, c1:distance(c1:last_pos(Input))).

twice_test() ->
    Input = "R8, R4, R4, R8",
    ExpectedDist = 8,
    ?assertEqual({4,0}, c1:first_visited_twice(Input)),
    ?assertEqual(ExpectedDist, c1:distance(c1:last_pos(Input))).

dist_r5_l5_r5_r3_test() ->
    Input = "R5, L5, R5, R3",
    ExpectedDist = 12,
    ?assertEqual(ExpectedDist, c1:distance(c1:last_pos(Input))).

big_test() ->
    Input = "R2, L3, R2, R4, L2, L1, R2, R4, R1, L4, L5, R5, R5, R2,
    R2, R1, L2, L3, L2, L1, R3, L5, R187, R1, R4, L1, R5, L3, L4, R50,
    L4, R2, R70, L3, L2, R4, R3, R194, L3, L4, L4, L3, L4, R4, R5, L1,
    L5, L4, R1, L2, R4, L5, L3, R4, L5, L5, R5, R3, R5, L2, L4, R4,
    L1, R3, R1, L1, L2, R2, R2, L3, R3, R2, R5, R2, R5, L3, R2, L5,
    R1, R2, R2, L4, L5, L1, L4, R4, R3, R1, R2, L1, L2, R4, R5, L2,
    R3, L4, L5, L5, L4, R4, L2, R1, R1, L2, L3, L2, R2, L4, R3, R2,
    L1, L3, L2, L4, L4, R2, L3, L3, R2, L4, L3, R4, R3, L2, L1, L4,
    R4, R2, L4, L4, L5, L1, R2, L5, L2, L3, R2, L2",
    ExpectedDist = 246,
    ?assertEqual({-109,-15}, c1:first_visited_twice(Input)),
    ?assertEqual(124, c1:distance(c1:first_visited_twice(Input))),
    ?assertEqual(ExpectedDist, c1:distance(c1:last_pos(Input))).
