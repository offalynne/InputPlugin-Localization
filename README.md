# Localization Input Plug-in

Keyboard layout localization for [Input for GameMaker 2024.8](https://github.com/offalynne/Input).

### API

```
InputLocalizeGetLocale() // Returns enum, user's keyboard locale

InputLocalizeBinding( // Returns a localized binding
  binding,            // Binding, a virtual key constant
  [locale])           // Enum, keyboard locale. If unspecified, user's locale is used

enum INPUT_KEYBOARD_LOCALE
  .QWERTY // English Latin key layout
  .AZERTY // Selective French key layout 
  .QWERTZ // Central European key layout  
```

### Example Usage

```
//Set localized key definitions
InputDefineVerb(INPUT_VERB.WALK_FORWARD, "up",    InputLocalizeBinding("W"), -gp_axislv);
InputDefineVerb(INPUT_VERB.STRAFE_LEFT,  "left",  InputLocalizeBinding("A"), -gp_axislh);
InputDefineVerb(INPUT_VERB.WALK_BACK,    "down",  InputLocalizeBinding("S"),  gp_axislv);
InputDefineVerb(INPUT_VERB.STRAFE_RIGHT, "right", InputLocalizeBinding("D"),  gp_axislh);
```

***NB: Per limitations of GM Runner application, plug-in always returns static OS region-default layout***

### **[Download (.yymps)](https://github.com/offalynne/InputPlugin-Localization/releases)**
