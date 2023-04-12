#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <raylib.h>
#include <lua/lauxlib.h>
#include <lua/lua.h>
#include <lua/luaconf.h>
#include <lua/lualib.h>


// binding C functions to Lua

///////////////////
// MONITOR/SPEC FUNCTIONS
///////////////////

static int lua_getmonitorwidth(lua_State *L) {
    int monitor = luaL_checknumber(L, 1);
    int monitorWidth = GetMonitorWidth(monitor);
    lua_pushnumber(L, monitorWidth);
    return 1;
}

static int lua_getmonitorheight(lua_State *L) {
    int monitor = luaL_checknumber(L, 1);
    int monitorHeight = GetMonitorHeight(monitor);
    lua_pushnumber(L, monitorHeight);
    return 1;
}

static int lua_togglefullscreen(lua_State *L) {
    ToggleFullscreen();
    return 0;
}

///////////////////
// FILESYSTEM
///////////////////

static int lua_fileexists(lua_State *L) {
    const char filename = luaL_checkstring(L, 1);
    FileExists(filename);
    return 1;
}

///////////////////
// CURSOR FUNCTIONS
///////////////////

static int lua_showcursor(lua_State *L) {
    ShowCursor();
    return 0;
} 

static int lua_hidecursor(lua_State *L) {
    HideCursor();
    return 0;
}

static int lua_iscursoronscreen(lua_State *L) {
    bool isCursorOnScreen = IsCursorOnScreen();
    lua_pushboolean(L, isCursorOnScreen);
    return 1;
}

///////////////////
// MOUSE FUNCTIONS
///////////////////

static int lua_getmousex(lua_State *L) {
    int mouseX = GetMouseX();
    lua_pushinteger(L, mouseX);
    return 1;
}

static int lua_getmousey(lua_State *L) {
    int mouseY = GetMouseY();
    lua_pushinteger(L, mouseY);
    return 1;
}

int lua_getmouseposition(lua_State *L) {
  if (!lua_istable(L, 1)) {
    lua_settop(L, 0);
    lua_createtable(L, 0, 2);
  }
  lua_settop(L, 1);
  Vector2 mousePosition = GetMousePosition();
  lua_pushinteger(L, mousePosition.x);
  lua_setfield(L, 1, "x");
  lua_pushinteger(L, mousePosition.y);
  lua_setfield(L, 1, "y");
  return 1;
}

static int lua_ismousebuttonpressed(lua_State *L) {
    int mouseButton = luaL_checknumber(L, 1);
    lua_pushboolean(L, IsMouseButtonPressed(mouseButton));
    return 1;
}

static int lua_ismousebuttonreleased(lua_State *L) {
    int mouseButton = luaL_checknumber(L, 1);
    lua_pushboolean(L, IsMouseButtonReleased(mouseButton));
    return 1;
}

static int lua_ismousebuttonup(lua_State *L) {
    int mouseButton = luaL_checknumber(L, 1);
    lua_pushboolean(L, IsMouseButtonUp(mouseButton));
    return 1;
}

static int lua_ismousebuttondown(lua_State *L) {
    int mouseButton = luaL_checknumber(L, 1);
    lua_pushboolean(L, IsMouseButtonDown(mouseButton));
    return 1;
}

static int lua_openurl(lua_State *L) {
    const char *url = luaL_checkstring(L, 1);
    OpenURL(url);
    return 0;
}

///////////////////
// KEYBOARD/INPUT FUNCTIONS
///////////////////

static int lua_setexitkey(lua_State *L) {
    int key = luaL_checkinteger(L, 1);
    SetExitKey(key);
    return 0;
}

static int lua_iskeyreleased(lua_State *L) {
    int key = luaL_checkinteger(L, 1);
    bool result = IsKeyReleased(key);
    lua_pushboolean(L, result);
    return 1;
}

static int lua_iskeypressed(lua_State *L) {
    int key = luaL_checkinteger(L, 1);
    bool result = IsKeyPressed(key);
    lua_pushboolean(L, result);
    return 1;
}

static int lua_iskeyup(lua_State *L) {
    int key = luaL_checkinteger(L, 1);
    bool result = IsKeyUp(key);
    lua_pushboolean(L, result);
    return 1;
}

static int lua_iskeydown(lua_State *L) {
    int key = luaL_checkinteger(L, 1);
    bool result = IsKeyDown(key);
    lua_pushboolean(L, result);
    return 1;
}

///////////////////
// FRAME/FPS FUNCTIONS
///////////////////

static int lua_setfps(lua_State *L) {
    unsigned int fps = luaL_checkinteger(L, 1);
    SetTargetFPS(fps);
    return 0;
}

static int lua_getfps(lua_State *L) {
    lua_pushnumber(L, GetFPS());
    return 1;
}

static int lua_deltaTime(lua_State *L) {
    lua_pushnumber(L, GetFrameTime());
    return 1; // args to lua stack
}

///////////////////
// DRAWING FUNCTIONS
///////////////////

static int lua_drawtexture(lua_State *L) {
    Texture2D *texture = lua_touserdata(L, 1);
    float xPosition = luaL_checknumber(L, 2);
    float yPosition = luaL_checknumber(L, 3);
    
    //TODO: let lua scripter determine the tint of the texture

    DrawTexture(*texture, xPosition, yPosition, WHITE);
    return 0;
}

static int lua_clearbackground(lua_State *L) {
    float hue = luaL_checknumber(L, 1);
    float saturation = luaL_checknumber(L, 2);
    float value = luaL_checknumber(L, 3);
    Color color = ColorFromHSV(
    hue, 
    saturation, 
    value);
    ClearBackground(color);
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

static int lua_loadtexture(lua_State *L) {
    const char *filename = luaL_checkstring(L, 1);
    Texture2D *texture = malloc(sizeof(Texture2D));
    *texture = LoadTexture(filename);
    lua_pushlightuserdata(L, texture);
    return 1;
}

static int lua_drawtext(lua_State *L) {
    const char *text = luaL_checkstring(L, 1);
    float x = luaL_checknumber(L, 2);
    float y = luaL_checknumber(L, 3);
    int fontsize = luaL_checkinteger(L, 4);
    float hue = luaL_checknumber(L, 5);
    float saturation = luaL_checknumber(L, 6);
    float value = luaL_checknumber(L, 7);
    Color color = ColorFromHSV(
    hue, 
    saturation, 
    value);

    DrawText(text, x, y, fontsize, color);
    return 0;
}

static int lua_drawline(lua_State *L) {
    int startPositionX = luaL_checkinteger(L, 1);
    int startPositionY = luaL_checkinteger(L, 2);
    int endPositionX = luaL_checkinteger(L, 3);
    int endPositionY = luaL_checkinteger(L, 4);

    float hue = luaL_checknumber(L, 5);
    float saturation = luaL_checknumber(L, 6);
    float value = luaL_checknumber(L, 7);
    Color color = ColorFromHSV(
    hue, 
    saturation, 
    value);
    DrawLine(startPositionX, startPositionY, endPositionX, endPositionY, color);
    return 0;
}

static int lua_drawpixel(lua_State *L) {
    int positionX = luaL_checkinteger(L, 1);
    int positionY = luaL_checkinteger(L, 2);

    float hue = luaL_checknumber(L, 5);
    float saturation = luaL_checknumber(L, 6);
    float value = luaL_checknumber(L, 7);
    Color color = ColorFromHSV(
    hue, 
    saturation, 
    value);

    DrawPixel(positionX, positionY, color);
    return 0;
}

static int lua_drawrect(lua_State *L) {
    float xpos = luaL_checknumber(L, 1);
    float ypos = luaL_checknumber(L, 2);
    float width = luaL_checknumber(L, 3);
    float height = luaL_checknumber(L, 4);
    float hue = luaL_checknumber(L, 5);
    float saturation = luaL_checknumber(L, 6);
    float value = luaL_checknumber(L, 7);
    Color color = ColorFromHSV(
    hue, 
    saturation, 
    value);
    DrawRectangle(xpos, ypos, width, height, color);
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
    lua_register(L, "IsKeyDown", lua_iskeydown);
    lua_register(L, "begin", lua_begindrawing);
    lua_register(L, "stop", lua_enddrawing);
    lua_register(L, "DrawText", lua_drawtext);
    lua_register(L, "cls", lua_clearbackground);
    lua_register(L, "DrawRect", lua_drawrect);
    lua_register(L, "DrawLine", lua_drawline);
    lua_register(L, "setfps", lua_setfps);
    lua_register(L, "DeltaTime", lua_deltaTime);
    lua_register(L, "WinShouldClose", lua_windowshouldclose);
    lua_register(L, "exit", lua_closewindow);
    lua_register(L, "getfps", lua_getfps);
    lua_register(L, "LoadImage", lua_loadtexture);
    lua_register(L, "DrawImage", lua_drawtexture);
    lua_register(L, "GetMousePosition", lua_getmouseposition);
    lua_register(L, "GetMonitorHeight", lua_getmonitorheight);
    lua_register(L, "GetMonitorWidth", lua_getmonitorwidth);
    lua_register(L, "ShowCursor", lua_showcursor);
    lua_register(L, "HideCursor", lua_hidecursor);
    lua_register(L, "IsCursorOnScreen", lua_iscursoronscreen);
    lua_register(L, "IsKeyReleased", lua_iskeyreleased);
    lua_register(L, "IsKeyPressed", lua_iskeypressed);
    lua_register(L, "IsKeyUp", lua_iskeyup);
    lua_register(L, "SetExitKey", lua_setexitkey);
    lua_register(L, "OpenURL", lua_openurl);
    lua_register(L, "GetMouseX", lua_getmousex);
    lua_register(L, "GetMouseY", lua_getmousey);
    lua_register(L, "IsMouseButtonPressed", lua_ismousebuttonpressed);
    lua_register(L, "IsMouseButtonReleased", lua_ismousebuttonreleased);
    lua_register(L, "IsMouseButtonDown", lua_ismousebuttondown);
    lua_register(L, "IsMouseButtonUp", lua_ismousebuttonup);
    lua_register(L, "DrawPixel", lua_drawpixel);
    lua_register(L, "ToggleFullscreen", lua_togglefullscreen);
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
            printf("could not find or load script! \n");
            printf("error: %s\n", lua_tostring(L, -1));
            lua_pop(L, 1);
            return 1;
        } else {
            printf("script call success \n");
            return 0;
        }
    return 0;
}
