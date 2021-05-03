#!/usr/bin/env escript

main([]) ->
    case file:read(standard_io, 10000000) of
    {ok, Data} ->
        Bin = iolist_to_binary(Data),
        Term = binary_to_term(Bin),
        io:format("Etf: ~p~n", [Term]);
    {error, _} = Error ->
        io:format("Error: ~p~n", [Error]),
        halt(1)
    end;
main(_) ->
    io:format("Usage: print_etf.es~n"),
    io:format("Reads data from stdin and prints as Erlang terms~n"),
    halt(1).
