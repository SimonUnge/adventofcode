-module(day2_tests).

-include_lib("eunit/include/eunit.hrl").

no_code_test() ->
    Input = "",
    ExpectedCode = none,
    ?assertEqual(ExpectedCode, day2:get_code(Input)).

get_4_test() ->
    Input = "L",
    ExpectedCode = 4,
    ?assertEqual(ExpectedCode, day2:get_code(Input)).

get_5_test() ->
    Input = "LR",
    ExpectedCode = 5,
    ?assertEqual(ExpectedCode, day2:get_code(Input)).

get_5_again_test() ->
    Input = "LLRRRLLRLR",
    ExpectedCode = 5,
    ?assertEqual(ExpectedCode, day2:get_code(Input)).

get_9_again_test() ->
    Input = "LLRRRLLRLRULDDRR",
    ExpectedCode = 9,
    ?assertEqual(ExpectedCode, day2:get_code(Input)).
