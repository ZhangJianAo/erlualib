-module(lual).

-export([dostring/2, dofile/2]).

-include("lua.hrl").
-include("lua_api.hrl").

dostring(#lua{port=Port}, Code) ->
    port_command(Port, term_to_binary({?ERL_LUAL_DOSTRING, Code})),
    lua_common:receive_valued_response().

dofile(#lua{port=Port}, File) ->
    port_command(Port, term_to_binary({?ERL_LUAL_DOFILE, File})),
    lua_common:receive_valued_response().
