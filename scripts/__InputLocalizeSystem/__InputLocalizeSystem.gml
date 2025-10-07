// Feather disable all

enum INPUT_KEYBOARD_LOCALE
{
    QWERTY,
    AZERTY,
    QWERTZ,
    __SIZE,
}

InputPlugInDefine("Alynne.Localization", "alynne", "1.1", "10.0", function(){ return; });

__InputLocalizeSystem();
function __InputLocalizeSystem()
{
    static _system = undefined;
    if (_system != undefined) return _system;

    _system = {};
    with(_system)
    {        
        __localeKeycodeToQWERTYArray = [];
        __localeQWERTYtoKeycodeArray = [];
        __locale = undefined;
        
        //Set locale per ISO 639-1 and ISO 3166-1
        switch(os_get_language() + "-" + os_get_region())
        {
            case "ar-DZ": case "ar-MA": case "ar-TN":
            case "br-FR": case "co-FR": case "ff-SN":
            case "fr-BE": case "fr-CD": case "fr-CI":
            case "fr-CM": case "fr-FR": case "fr-HT":
            case "fr-MA": case "fr-MC": case "fr-ML":
            case "fr-RE": case "nl-BE": case "oc-FR":
            case "wo-SN": case "tzm-DZ":
            case "mg-":   case "gsw-FR":
                __locale = INPUT_KEYBOARD_LOCALE.AZERTY;
            break;  

            case "cs-CZ": case "de-AT": case "de-CH":
            case "de-DE": case "de-LI": case "de-LU":
            case "fr-CH": case "fr-LU": case "sq-AL":
            case "hr-BA": case "hr-HR": case "hu-HU":
            case "lb-LU": case "rm-CH": case "sk-SK":
            case "sl-SI": case "dsb-DE":
            case "sr-BA": case "hsb-DE":
                __locale = INPUT_KEYBOARD_LOCALE.QWERTZ;
            break;

            default:
                __locale = INPUT_KEYBOARD_LOCALE.QWERTY;
            break;
        }

        //Set localisation maps
        repeat (INPUT_KEYBOARD_LOCALE.__SIZE)
        {
            array_push(__localeKeycodeToQWERTYArray, ds_map_create());
            array_push(__localeQWERTYtoKeycodeArray, ds_map_create());
        }

        var _SetLocaleMapping = function(_locale, _keycodeArray)
        {
            var _keycodeInput  = undefined;
            var _keycodeOutput = undefined;

            var _i = 0;
            var _length = array_length(_keycodeArray);
            repeat(_length)
            {
                _keycodeInput  = _keycodeArray[_i];
                _keycodeOutput = _keycodeArray[(_i + 1) mod _length];

                if (is_string(_keycodeInput )) _keycodeInput  = ord(_keycodeInput);
                if (is_string(_keycodeOutput)) _keycodeOutput = ord(_keycodeOutput);

                __localeQWERTYtoKeycodeArray[@ _locale][? _keycodeInput ] = _keycodeOutput;
                __localeKeycodeToQWERTYArray[@ _locale][? _keycodeOutput] = _keycodeInput;

                ++_i;
            }
        }

        _SetLocaleMapping(INPUT_KEYBOARD_LOCALE.QWERTZ, ["Y", "Z"]);
        _SetLocaleMapping(INPUT_KEYBOARD_LOCALE.AZERTY, ["Q", "A"]);
        _SetLocaleMapping(INPUT_KEYBOARD_LOCALE.AZERTY, ["W", "Z"]);
        _SetLocaleMapping(INPUT_KEYBOARD_LOCALE.AZERTY, [vk_semicolon, "M", vk_comma]);
    }
    
    return _system;
}
