#include <stdio.h>
#include <stdlib.h>
#include <raylib.h>
#include <lua/lauxlib.h>
#include <lua/lua.h>
#include <lua/luaconf.h>
#include <lua/lualib.h>
#include <string.h>
#include "raylua.h"

char *get_executable_path() {
    char *executable_path = NULL;
    uint32_t size = 0;

    // Get the size of the executable path buffer
    _NSGetExecutablePath(NULL, &size);

    // Allocate the executable path buffer
    executable_path = (char*)malloc(sizeof(char) * size);

    // Get the executable path
    if (_NSGetExecutablePath(executable_path, &size) == 0) {
        // Find the last occurrence of '/' character
        char *last_slash = strrchr(executable_path, '/');
        if (last_slash != NULL) {
            // Replace the '/' character with null character
            *(last_slash) = '\0';
        } else {
            // Error: executable path does not contain '/'
            free(executable_path);
            return NULL;
        }
    } else {
        // Error: unable to get executable path
        free(executable_path);
        return NULL;
    }

    return executable_path;
}

int main(void) {
    char *executable_path = get_executable_path();
    if (executable_path == NULL) {
        fprintf(stderr, "Error: unable to get executable path\n");
        return 1;
    }

    // Remove trailing slash from executable path
    size_t len = strlen(executable_path);
    if (len > 0 && executable_path[len-1] == '/') {
        executable_path[len-1] = '\0';
    }

    char *script_path = (char*)malloc(sizeof(char) * (strlen(executable_path) + strlen("/scripts/main.lua") + 1));
    sprintf(script_path, "%s/scripts/main.lua", executable_path);
    free(executable_path);
    //printf("script path: %s\n", script_path);

    lua_State *L = luaL_newstate();
    
    registerBindings(L);
    
    doScript(script_path, L);
    
    lua_close(L);
    free(script_path);
    return 0;
}