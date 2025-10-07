// Feather disable all

function InputLocalizeBinding(_binding, _locale = undefined)
{
    static _system = __InputLocalizeSystem();

    if (is_string(_binding))
    {
        _binding = ord(_binding);
    }

    if (_locale == undefined)
    {
        _locale = InputLocalizeGetLocale();
    }

    return _system.__localeKeycodeMapArray[_locale][? _binding] ?? _binding;
}