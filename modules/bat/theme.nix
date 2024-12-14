# https://youngspe.dev/textmate-grammar-playground/
# http://www.sublimetext.com/docs/scope_naming.html#color_schemes
{config, ...}:
with config.lib.consona;
# xml
  ''
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">

    <plist version="1.0">
       <dict>
          <key>name</key><string>Consona</string>

          <key>colors</key>
          <dict>
             <key>background</key><string>#1c1e26</string>
             <key>foreground</key><string>#bbbbbb</string>
          </dict>

          <key>settings</key>
          <array>
             <dict>
                <key>name</key><string>Comment</string>
                <key>scope</key><string>comment, punctuation.definition.comment</string>
                <key>settings</key>
                <dict>
                   <key>foreground</key><string>#4c4d53</string>
                </dict>
             </dict>
             <dict>
                <key>name</key><string>Keyword</string>
                <key>scope</key><string>keyword, storage.type, punctuation.definition.lifetime, variable.language.super</string>
                <key>settings</key>
                <dict>
                   <key>foreground</key><string>#a86ec9</string>
                </dict>
             </dict>
             <dict>
                <key>name</key><string>Delimiter</string>
                <key>scope</key><string>punctuation</string>
                <key>settings</key>
                <dict>
                   <key>foreground</key><string>#6c6d71</string>
                </dict>
             </dict>
             <dict>
                <key>name</key><string>Delimiter</string>
                <key>scope</key><string>keyword.operator</string>
                <key>settings</key>
                <dict>
                   <key>foreground</key><string>#6c6d71</string>
                </dict>
             </dict>
             <dict>
                <key>name</key><string>Namespace</string>
                <key>scope</key><string>entity.name.namespace</string>
                <key>settings</key>
                <dict>
                   <key>foreground</key><string>#25b0bc</string>
                </dict>
             </dict>
             <dict>
                <key>name</key><string>Function</string>
                <key>scope</key><string>meta.attribute, entity.name.function</string>
                <key>settings</key>
                <dict>
                   <key>foreground</key><string>#25b0bc</string>
                </dict>
             </dict>
             <dict>
                <key>name</key><string>Type</string>
                <key>scope</key><string>entity.name.type, variable.language.self</string>
                <key>settings</key>
                <dict>
                   <key>foreground</key><string>#fac29a</string>
                </dict>
             </dict>
             <dict>
                <key>name</key><string>Builtin</string>
                <key>scope</key><string>entity.name.type.numeric</string>
                <key>settings</key>
                <dict>
                   <key>foreground</key><string>#f09483</string>
                </dict>
             </dict>
             <dict>
                <key>name</key><string>Variable</string>
                <key>scope</key><string>variable</string>
                <key>settings</key>
                <dict>
                   <key>foreground</key><string>#e95678</string>
                </dict>
             </dict>
             <dict>
                <key>name</key><string>Constant</string>
                <key>scope</key><string>constant</string>
                <key>settings</key>
                <dict>
                   <key>foreground</key><string>#db887a</string>
                </dict>
             </dict>
             <dict>
                <key>name</key><string>String</string>
                <key>scope</key><string>string, punctuation.definition.string, punctuation.definition.char</string>
                <key>settings</key>
                <dict>
                   <key>foreground</key><string>#e4a88a</string>
                </dict>
             </dict>
          </array>
       </dict>
    </plist>
  ''
