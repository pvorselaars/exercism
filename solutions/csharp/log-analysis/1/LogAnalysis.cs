public static class LogAnalysis 
{
    public static string SubstringAfter(this string str, string delimiter)
    {
        var index = str.IndexOf(delimiter);

        if (index == -1) 
            return string.Empty;

        return str.Substring(index + delimiter.Length);
    }

    public static string SubstringBetween(this string str, string delimiter1, string delimiter2)
    {
        var start = str.SubstringAfter(delimiter1);
        var end = start.IndexOf(delimiter2);

        if (end == -1)
            return start;

        return start.Substring(0, end);
    }

    // TODO: define the 'Message()' extension method on the `string` type
    public static string Message(this string str)
    {
        return str.SubstringAfter(":").Trim();
    }

    // TODO: define the 'LogLevel()' extension method on the `string` type
    public static string LogLevel(this string str)
    {
        return str.SubstringBetween("[", "]");
    }
}