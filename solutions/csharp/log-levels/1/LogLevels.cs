static class LogLine
{
    public static string Message(string logLine)
    {
        return logLine.Split(":")[1].Trim();
    }

    public static string LogLevel(string logLine)
    {
        var level = logLine.Split(":");
        return level[0].Substring(1, level[0].Length - 2).ToLowerInvariant();
    }

    public static string Reformat(string logLine)
    {
        var message = Message(logLine);
        var logLevel = LogLevel(logLine);
        return $"{message} ({logLevel})";
    }
}
