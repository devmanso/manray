#include <stdio.h>
#include <raylib.h>
#include <lua/lauxlib.h>
#include <lua/lua.h>
#include <lua/luaconf.h>
#include <lua/lualib.h>
#include <string.h>


// binding C functions to Lua

static int lua_deltaTime(lua_State *L) {
    lua_pushnumber(L, GetFrameTime());
    return 1; // args to lua stack
}

static int lua_drawtext(lua_State *L) {
    const char *text = luaL_checkstring(L, 1);
    float x = luaL_checknumber(L, 2);
    float y = luaL_checknumber(L, 3);
    int fontsize = luaL_checkinteger(L, 4);
    unsigned int colorValue = luaL_checkinteger(L, 5);
    Color color = ColorFromHSV((float)colorValue, 1.0f, 1.0f);

    DrawText(text, x, y, fontsize, color);

    return 0;
}

static int lua_drawrect(lua_State *L) {
    float xpos = luaL_checknumber(L, 1);
    float ypos = luaL_checknumber(L, 2);
    float width = luaL_checknumber(L, 3);
    float height = luaL_checknumber(L, 4);
    unsigned int colorValue = luaL_checkinteger(L, 5);
    Color color = ColorFromHSV((float)colorValue, 1.0f, 1.0f);
    DrawRectangle(xpos, ypos, width, height, color);
    return 0;
}

static int lua_clearbackground(lua_State *L) {
    unsigned int colorValue = luaL_checkinteger(L, 1);
    Color color = ColorFromHSV((float)colorValue, 1.0f, 1.0f);
    ClearBackground(color);
    return 0;
}

static int lua_setfps(lua_State *L) {
    unsigned int fps = luaL_checkinteger(L, 1);
    SetTargetFPS(fps);
    return 0;
}

static int lua_windowshouldclose(lua_State *L) {
    lua_pushboolean(L, WindowShouldClose());
    return 1;
}

static int lua_initwindow(lua_State *L) {
    int width = luaL_checkinteger(L, 1);
    int height = luaL_checkinteger(L, 2);
    const char *title = luaL_checkstring(L, 3);
    InitWindow(width, height, title);
    return 0;
}

static int lua_begindrawing(lua_State *L) {
    BeginDrawing();
    return 0;
}

static int lua_enddrawing(lua_State *L) {
    EndDrawing();
    return 0;
}

static int lua_closewindow(lua_State *L) {
    CloseWindow();
    return 0;
}
//////////////


// register all functions here
/**
 * registers the standard Lua library, as well as some raylib functions
*/
void registerBindings(lua_State *L) {
    //load lua standard library
    luaL_openlibs(L);
    // push c functions to Lua, and register them globally
    lua_register(L, "init", lua_initwindow);
    lua_register(L, "begin", lua_begindrawing);
    lua_register(L, "stop", lua_enddrawing);
    lua_register(L, "DrawText", lua_drawtext);
    lua_register(L, "cls", lua_clearbackground);
    lua_register(L, "DrawRect", lua_drawrect);
    lua_register(L, "setfps", lua_setfps);
    lua_register(L, "DeltaTime", lua_deltaTime);
    lua_register(L, "WinShouldClose", lua_windowshouldclose);
    lua_register(L, "exit", lua_closewindow);
}

/**
 * this loads a script based on the filepath given,
 * if there is an error within the script, or an incorrect file path,
 * an error will be thrown.
 * 
 * @param filepath[] the filepath to the lua script (must include .lua extention)
 * @param lua_State*L pointer to lua_State, create a pointer to the lua_State by
 * doing: lua_State *L = luaL_newstate(); then pass the lua_State into this function
 * 
 * @example doScript("path/to/script.lua",L)
*/
int doScript(const char filepath[], lua_State *L) {
    if(luaL_dofile(L, filepath) !=0 ) {
            printf("could not find or load script!");
            printf("error: %s\n", lua_tostring(L, -1));
            lua_pop(L, 1);
            return 1;
        } else {
            printf("script call success \n");
            return 0;
        }
    return 0;
}