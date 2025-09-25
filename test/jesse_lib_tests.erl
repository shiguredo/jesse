%% @author Nicholas Lundgaard <nalundgaard@gmail.com>

%% @doc EUnit tests for jesse_lib.
-module(jesse_lib_tests).

-include_lib("eunit/include/eunit.hrl").


re_run_default_test_() ->
    {setup,
     fun() ->
             application:load(jesse)
     end,
     fun(_) ->
             application:unload(jesse)
     end,
     [{"Support ISO Latin-1 letters in \w by default",
       ?_assertEqual(match,
                     jesse_lib:re_run(<<"föø"/utf8>>, "^\\w+$"))},
      {"Support ISO Latin-1 numbers in \d by default",
       ?_assertEqual(match,
                     jesse_lib:re_run(<<"123"/utf8>>, "^\\d+$"))},
      {"Support beyond ISO Latin-1 letters in \w by default",
       ?_assertEqual(match,
                     jesse_lib:re_run(<<"fōô"/utf8>>, "^\\w+$"))},
      {"Support beyond ISO Latin-1 numbers in \d by default",
       ?_assertEqual(match,
                     jesse_lib:re_run(<<"3๓३"/utf8>>, "^\\d+$"))}]}.


%% OTP 28.0からPCRE2を利用することになり、
%% [unicode]のみではASCII文字のみマッチし、
%% ISO Latin-1文字やUnicode文字はマッチしない
re_run_unicode_only_test_() ->
    {setup,
     fun() ->
             application:load(jesse),
             application:set_env(jesse, re_options, [unicode])
     end,
     fun(_) -> application:unload(jesse) end,
     [{"Only ASCII letters match in \\w without 'ucp'",
       ?_assertEqual(match,
                     jesse_lib:re_run(<<"foo"/utf8>>, "^\\w+$"))},
      {"ISO Latin-1 letters do not match in \\w without 'ucp'",
       ?_assertEqual(nomatch,
                     jesse_lib:re_run(<<"föø"/utf8>>, "^\\w+$"))},
      {"ASCII numbers match in \\d without 'ucp'",
       ?_assertEqual(match,
                     jesse_lib:re_run(<<"123"/utf8>>, "^\\d+$"))},
      {"Beyond ISO Latin-1 letters do not match in \\w without 'ucp'",
       ?_assertEqual(nomatch,
                     jesse_lib:re_run(<<"fōô"/utf8>>, "^\\w+$"))},
      {"Beyond ISO Latin-1 numbers do not match in \\d without 'ucp'",
       ?_assertEqual(nomatch,
                     jesse_lib:re_run(<<"3๓३"/utf8>>, "^\\d+$"))}]}.


%% 明示的に[unicode, ucp]を設定して
%% Unicode文字全般がマッチすることを確認
re_run_with_ucp_test_() ->
    {setup,
     fun() ->
             application:load(jesse),
             application:set_env(jesse, re_options, [unicode, ucp])
     end,
     fun(_) -> application:unload(jesse) end,
     [{"Support ISO Latin-1 letters in \\w with explicit 'ucp'",
       ?_assertEqual(match,
                     jesse_lib:re_run(<<"föø"/utf8>>, "^\\w+$"))},
      {"Support ISO Latin-1 numbers in \\d with explicit 'ucp'",
       ?_assertEqual(match,
                     jesse_lib:re_run(<<"123"/utf8>>, "^\\d+$"))},
      {"Support beyond ISO Latin-1 letters in \\w with explicit 'ucp'",
       ?_assertEqual(match,
                     jesse_lib:re_run(<<"fōô"/utf8>>, "^\\w+$"))},
      {"Support beyond ISO Latin-1 numbers in \\d with explicit 'ucp'",
       ?_assertEqual(match,
                     jesse_lib:re_run(<<"3๓३"/utf8>>, "^\\d+$"))}]}.
