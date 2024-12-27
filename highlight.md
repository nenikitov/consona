# Languages

## Nix

```nix
# Some sample nix code
{
  lib,
  pkgs,
  ...
} @ args: let
  getBackgroundColor = timeOfDay:
    if timeOfDay == "morning"
    then "lightyellow"
    else if timeOfDay == "afternoon"
    then "lightblue"
    else "black";
  backgroundColor = getBackgroundColor "morning";
  content = [
    (greet "Nix User")
    "Background color: ${backgroundColor}"
    true
    null
  ];
  output = builtins.concatStringsSep "\n" content;
  multiply = x: y: x * y;
  multiplyOther = {x ? 10, y} x * y;
  test = import ./whatever args;
in {
  imports = [
    ./my/module/here
    ./my/other/module.nix
  ];
  options = {
    test = lib.mkOption {
      name = "hello";
      default = 10;
    };
  };
  config = let
    inherit (lib) mkOption mkOptionType;
  in {
    xdg.configFile."my/app.cfg".text = ''
      Some configuration
    '';
    home.packages = with pkgs; [
      neofetch
      zip
    ];
  };
}
```

## HTML / XML

```html
<!-- Some sample html code -->
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Title</title>
    <meta charset="UTF-8">
    <meta name="description" content="A test page &amp; special">
  </head>
  <body>
    <img src="./hello.world">
    Here is some text with &amp; character
  </body>
</html>
```

### CSS

```css
/* Sample css code */
body #header .class {
  background-color: #f0f0f0;
  font-family: 'Arial', sans-serif;
  margin: 0px 1rem 50% auto;
  padding: auto !important;
  color: rgba(0, 0, 0, 0.1);
}

@media (max-width: 768px) {
  body {
    background-color: #ffffff;  /* White background on smaller screens */
  }
}

input[type="text"]:focus, body::before {
  content: '→';
  color: #4CAF50;
  margin-right: 5px;
  text-align: justify;
}

@keyframes fadeIn {
  from {
    opacity: 0;
  }
  to {
    opacity: 1;
  }
}

.fade-in {
  animation: fadeIn 2s ease-in-out;
}
```

### YAML

```yaml
# Sample yaml code
name: John
familyName: "Doe"
age: 30
isAdmin: true
address:
  city: Springfield
  zip: 62701
  apartment: null

food:
  - apple
  - banana
  - name: "Unknown \n"
    taste: sweet

list: [10, 20]
object: {name: "John"}

description: |
  Multiline string
  is here

description: >
  Other multiline string string
  is here

anchor: &anchor
  color: "blue"

items:
  - name: "Shirt"
    <<: *anchor
```

## JSON

```jsonc
// Sample json code
{
  "name": "John",
  "age": 30,
  "isAdmin": true,
  "address": {
    "city": "Springfield",
    "zip": 62701,
    "apartment": null
  },
  "food": [
    "apple",
    "banana",
    {
      "name": "Unknown\n",
      "taste": "sweet"
    }
  ]
}
```

## TOML


```toml
# Sample toml code
[owner]
name = "John Doe"
email = "johndoe@example.com"

[database]
server = "localhost"
ports = [8000, 8001, 8002]
enabled = true

[servers]
  [servers.alpha]
  ip = "192.168.1.1"
  port = 8080

[[products]]
name = "Laptop"
price = 999.99
tags = ["electronics", "computers"]

[[products]]
name = "Smartphone"
price = 699.99
tags = ["electronics", "mobile"]
```

### PIP REQUIREMENTS

```requirements
# Sample pip requirements code
requests==2.28.1
numpy>=1.21
matplotlib>=3.4.0,<3.6.0
```

### INI

```ini
# Sample ini code
[general]
name = John Doe
email = "johndoe@example.com"
age = 30
isAdmin = true
```
