// Feather disable all

enum INPUT_KEYBOARD_LOCALE
{
    QWERTY,
    AZERTY,
    QWERTZ,
    __SIZE,
}

__InputLocalizeSystem();
function __InputLocalizeSystem()
{
    static _system = undefined;
    if (_system != undefined) return _system;

    _system = {};
    with(_system)
    {        
        __localeKeycodeMapArray = [];
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

        //Set localisation map
        repeat (INPUT_KEYBOARD_LOCALE.__SIZE)
        {
            array_push(__localeKeycodeMapArray, ds_map_create());
        }

        //AZERTY ';' -> 'M' -> ',' -> ';'
        __localeKeycodeMapArray[@ INPUT_KEYBOARD_LOCALE.AZERTY][? vk_semicolon] = ord("M");
        __localeKeycodeMapArray[@ INPUT_KEYBOARD_LOCALE.AZERTY][? ord("M")    ] = vk_comma;
        __localeKeycodeMapArray[@ INPUT_KEYBOARD_LOCALE.AZERTY][? vk_comma    ] = vk_semicolon;

        //AZERTY 'Q' <-> 'A'
        __localeKeycodeMapArray[@ INPUT_KEYBOARD_LOCALE.AZERTY][? ord("Q")] = ord("A");
        __localeKeycodeMapArray[@ INPUT_KEYBOARD_LOCALE.AZERTY][? ord("A")] = ord("Q");

        //AZERTY 'W' <-> 'Z'
        __localeKeycodeMapArray[@ INPUT_KEYBOARD_LOCALE.AZERTY][? ord("W")] = ord("Z");
        __localeKeycodeMapArray[@ INPUT_KEYBOARD_LOCALE.AZERTY][? ord("Z")] = ord("W");

        //QWERTZ 'Y' <-> 'Z'
        __localeKeycodeMapArray[@ INPUT_KEYBOARD_LOCALE.QWERTZ][? ord("Y")] = ord("Z");
        __localeKeycodeMapArray[@ INPUT_KEYBOARD_LOCALE.QWERTZ][? ord("Z")] = ord("Y");
        
        //Circumvent plug-in registry to avoid pre-init error...
        __InputTrace("Using Alynne.Localization");
    }
    
    return _system;
}