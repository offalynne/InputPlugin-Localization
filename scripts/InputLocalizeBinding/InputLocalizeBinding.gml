// Feather disable all

function InputLocalizeBinding(_binding, _localeInput = INPUT_KEYBOARD_LOCALE.QWERTY, _localeOutput = undefined)
{
    static _system = __InputLocalizeSystem();

    if (is_string(_binding))
    {
        _binding = ord(_binding);
    }

    if (_localeInput == _localeOutput)
    {
        return _binding;
    }

    if (_localeOutput == undefined)
    {
        _localeOutput = InputLocalizeGetLocale();
    }

    if (_localeInput != INPUT_KEYBOARD_LOCALE.QWERTY)
    {
        _binding = _system.__localeKeycodeToQWERTYArray[_localeInput][? _binding] ?? _binding;
    }

    return _system.__localeQWERTYtoKeycodeArray[_localeOutput][? _binding] ?? _binding;
}
