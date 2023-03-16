## Credits:
- raylib (https://www.raylib.com/index.html), raylib is liscensed under the zlib liscense (https://www.raylib.com/license.html)
- Lua (https://www.lua.org)

## Prerequisites:
- you must have the Lua interpreter and raylib libraries installed on your system, (I'm using 5.4.1, but any version of Lua 5.1 and above should be just fine), you can install both through homebrew
- A C99 complaint compiler.

## How do I build this?
To build a binary and run this, open your terminal and cd or navigate to wherever you have this on your system.

Next, enter 'make game' - this will produce the binary, given that there are no errors in your code.

Finally, to run the binary, enter './main'

This project is liscensed under the MIT Liscense (see LICENSE.md)

## Creating a bundle
When you double-click on a MacOSX app to run it, it's not actually running a standalone executable, it's a bundle of directories, with the root directory having a ".app" at the end.

To create an app bundle first create these directories:
- NAME.app (where NAME, is the name of your app)
- NAME.app/Contents
- NAME.app/Contents/Resources
- NAME.app/Contents/MacOS
- NAME.app/Contents/MacOS/scripts


Now that you have created the app bundle directories, you will need to move your sounds, scripts, images etc.. into the app bundle:
- in NAME.app/Contents/MacOS, copy-paste the "main" UNIX executable file into the directory, "main" is the engine that interprets your Lua scripts
- in NAME.app/Contents/MacOS/scripts, copy-paste all of your Lua script into this directory, as the engine will look for the main.lua script and execute it
- in NAME.app/Contents, create an "info.plist" file, then insert this text:

```<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>CFBundleGetInfoString</key>
  <string>Main</string>
  <key>CFBundleExecutable</key>
  <string>main</string>
  <key>CFBundleIdentifier</key>
  <string>com.mansodev.www</string>
  <key>CFBundleName</key>
  <string>main</string>
  <key>CFBundleShortVersionString</key>
  <string>0.01</string>
  <key>CFBundleInfoDictionaryVersion</key>
  <string>6.0</string>
  <key>CFBundlePackageType</key>
  <string>APPL</string>
  <key>IFMajorVersion</key>
  <integer>0</integer>
  <key>IFMinorVersion</key>
  <integer>1</integer>
</dict>
</plist>
```

you can modify the plist to your liking, as it doesn't change how the application runs, if you have an icon for your app, put the .icns image into Resources and call it in the plist.

After you've done all that, your app is now complete! To run the app, double click the app icon.