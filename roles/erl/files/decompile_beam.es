#!/usr/bin/env escript

main([]) ->
    io:format("Usage: decompile_beam.es <BEAM_FILE>~n"),
    halt(1);
main([BeamFile]) ->
    case beam_lib:chunks(BeamFile, [abstract_code]) of
    {ok, {_Module, [{abstract_code, {raw_abstract_v1, Forms}}]}} ->
        io:format("~s~n", [erl_prettypr:format(erl_syntax:form_list(Forms))]),
        halt(0);
    {ok, {_Module, [{abstract_code, no_abstract_code}]}} ->
        io:format("Beam is not compiled with 'debug_info'~n", []),
        halt(1);
    {error, _} = Error ->
        io:format("~p~n", [Error]),
        halt(1)
    end.
