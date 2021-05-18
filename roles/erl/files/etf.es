#!/usr/bin/env escript

main(["-h"]) ->
    usage();
main(["--help"]) ->
    usage();
main([Str]) ->
    case parse_term(Str) of
    {ok, Term} ->
        file:write(standard_io, term_to_binary(Term));
    {error, _} = Error ->
        io:format(standard_error, "Error: ~p~n", [Error]),
        halt(1)
    end;
main([]) ->
    case file:read(standard_io, 10000000) of
    {ok, Data} ->
        io:format("~p~n", [binary_to_term(iolist_to_binary(Data))]);
    eof ->
        ok;
    {error, _} = Error ->
        io:format(standard_error, "Error: ~p~n", [Error]),
        halt(1)
    end.

parse_term(Str) ->
    case erl_scan:string(ensure_ends_with($., Str)) of
    {ok, Tokens, _} ->
        erl_parse:parse_term(Tokens);
    {error, Info, Location} ->
        {error, {Info, Location}}
    end.

ensure_ends_with(Char, Str) ->
    case ends_with(Char, Str) of
    true ->
        Str;
    false ->
        Str ++ [Char]
    end.

ends_with(Char, Str) ->
    lists:last(string:strip(Str)) =:= Char.

usage() ->
    io:format("Usage: etf.es [Erlang Term]~n"),
    io:format("With argument converts given term to binary etf and writes to stdout~n"),
    io:format("Without argument reads binary etf from stdin and writes to stdout~n"),
    io:format("Example:~n"),
    io:format(" $ etf.es [1,2,3] | etf.es~n"),
    io:format(" [1,2,3]~n").
