#include <stdio.h>
#include <raylib.h>
#include <lua/lauxlib.h>
#include <lua/lua.h>
#include <lua/luaconf.h>
#include <lua/lualib.h>
#include <string.h>
#include "raylua.h"

int main() {

    lua_State *L = luaL_newstate();
    
    registerBindings(L);
    
    doScript("scripts/main.lua", L);
    
    lua_close(L);
    return 0;
}