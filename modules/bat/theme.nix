{config, ...}:
with config.lib.styler;
# xml
  ''
    <!-- http://www.sublimetext.com/docs/scope_naming.html#color_schemes -->
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">

    <plist version="1.0">
      <dict>
        <key>name</key><string>NeTheme</string>

        <!-- <key>colorSpaceName</key><string>sRGB</string> -->

        <key>settings</key>
        <array>
          <!-- Comments -->
          <dict>
            <key>name</key><string>Comments</string>
            <key>scope</key><string>comment</string>
            <key>settings</key>
            <dict>
              <key>foreground</key><string>${ansiToHex "red"}</string>
            </dict>
          </dict>
        </array>
      </dict>
    </plist>
  ''
