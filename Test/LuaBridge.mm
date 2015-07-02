//
//  LuaBridge.m
//  TestLua
//
//  Created by fengxiao on 15/6/30.
//  Copyright (c) 2015年 hick. All rights reserved.
//

#import <Foundation/Foundation.h>

extern "C"
{
#include "lauxlib.h"
#include "lualib.h"
#include "lua.h"
#include "LuaBridge.h"  

void initLua(lua_State *L)
{
    luaopen_base(L);
    luaopen_table(L);
    luaL_openlibs(L);
    luaopen_string(L);
    luaopen_math(L);
}


void initLuaEngine()
{
    lua_State* L = luaL_newstate();
    initLua(L);
    int ret = luaL_loadfile(L, "main.lua");
    if(ret != 0)
    {
        NSLog(@"error");
        return;
    }
    lua_pcall(L, 0, 0, 0);
    
}



};