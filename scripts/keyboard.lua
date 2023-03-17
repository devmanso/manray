keyboard = {}
-- symbol keys
keyboard.none = 0 -- use for when no key is pressed
keyboard.apostrophe = 39 -- '
keyboard.comma = 44 -- ,
keyboard.minus = 45 -- -
keyboard.period = 46 -- .
keyboard.slash = 47 -- /
keyboard.semicolon = 59 -- ;
keyboard.equal = 61 -- =
keyboard.leftbracket = 91 -- [
keyboard.backslash = 92 -- \
keyboard.rightbracket = 93 -- ]
keyboard.backtick = 96 -- `

-- number keys
keyboard.zero = 48
keyboard.one = 49
keyboard.two = 50
keyboard.three = 51
keyboard.four = 52
keyboard.five = 53
keyboard.six = 54
keyboard.seven = 55
keyboard.eight = 56
keyboard.nine = 57

-- letters
keyboard.a = 65
keyboard.b = 66
keyboard.c = 67
keyboard.d = 68
keyboard.e = 69
keyboard.f = 70
keyboard.g = 71
keyboard.h = 72
keyboard.i = 73
keyboard.j = 74
keyboard.k = 75
keyboard.l = 76
keyboard.m = 77
keyboard.n = 78
keyboard.o = 79
keyboard.p = 80
keyboard.q = 81
keyboard.r = 82
keyboard.s = 83
keyboard.t = 84
keyboard.u = 85
keyboard.v = 86
keyboard.w = 87
keyboard.x = 88
keyboard.y = 89
keyboard.z = 90

-- function keys
keyboard.space = 32
keyboard.escape = 256
keyboard.enter = 257
keyboard.tab = 258
keyboard.backspace = 259
keyboard.insert = 260
keyboard.delete = 261
keyboard.rightarrow = 262
keyboard.leftarrow = 263
keyboard.downarrow = 264
keyboard.uparrow = 265
keyboard.pageup = 266
keyboard.pagedown = 267
keyboard.home = 268
 --[[ this can't be called 'end' because the Lua interpreter will think it's the end of something, 
 and will throw an error]]
keyboard.endkey = 269
keyboard.capslock = 280
keyboard.scrolllock = 281
keyboard.numlock = 282
keyboard.printscreen = 283
keyboard.pause = 284

-- top row keys
keyboard.f1 = 290
keyboard.f2 = 291
keyboard.f3 = 292
keyboard.f4 = 293
keyboard.f5 = 294
keyboard.f6 = 295
keyboard.f7 = 296
keyboard.f8 = 297
keyboard.f9 = 298
keyboard.f10 = 299
keyboard.f11 = 300
keyboard.f12 = 301

-- bottom and side keys
keyboard.leftshift = 340
keyboard.leftcontrol = 341
keyboard.leftalt = 342
keyboard.leftsystemkey = 343 --[[ the system key or super key, is the command key on MacOS, 
or the Windows logo key on Windows]]
keyboard.rightshift = 344
keyboard.rightcontrol = 345
keyboard.rightalt = 346
keyboard.rightsystemkey = 347
keyboard.menu = 348

-- Keypad
keyboard.keypad = {}
keyboard.keypad.zero = 320
keyboard.keypad.one = 321
keyboard.keypad.two = 322
keyboard.keypad.three = 323
keyboard.keypad.four = 324
keyboard.keypad.five = 325
keyboard.keypad.six = 326
keyboard.keypad.seven = 327
keyboard.keypad.eight = 328
keyboard.keypad.nine = 329
keyboard.keypad.period = 330
keyboard.keypad.divide = 331
keyboard.keypad.multiply = 332
keyboard.keypad.subtract = 333
keyboard.keypad.add = 334
keyboard.keypad.enter = 335
keyboard.keypad.equal = 336

return keyboard
