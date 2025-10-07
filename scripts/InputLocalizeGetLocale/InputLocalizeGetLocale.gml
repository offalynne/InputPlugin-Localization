// Feather disable all

function InputLocalizeGetLocale()
{
    static _locale = __InputLocalizeSystem().__locale;
    return _locale;
}