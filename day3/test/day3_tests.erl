-module(day3_tests).
-include_lib("eunit/include/eunit.hrl").

invalid_triangle_test() ->
    Input = [5, 10, 25],
    ExpectedCode = false,
    ?assertEqual(ExpectedCode, day3:valid_triangle(Input)).

valid_triangle_test() ->
    Input = [5, 10, 10],
    ExpectedCode = true,
    ?assertEqual(ExpectedCode, day3:valid_triangle(Input)).

valid_triangles_test() ->
    Input = day3:file_to_list_of_rectangles("input.txt"),
    ?assertEqual(862, length(lists:filter(fun day3:valid_triangle/1, Input))).

valid_transformed_triangles_test() ->
    Input = day3:file_to_list_of_rectangles("input.txt"),
    TransInput = day3:transform_from_vertical(Input),
    ?assertEqual(1577, length(lists:filter(fun day3:valid_triangle/1, TransInput))).
