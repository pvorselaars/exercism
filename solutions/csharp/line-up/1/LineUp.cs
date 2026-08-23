public static class LineUp
{
    public static string Format(string name, int number)
    {
        string suffix = "th";
        int lastDigit = number % 10;
        int lastDigits = number % 100;

        if (lastDigit == 1 && lastDigits != 11)
            suffix = "st";

        if (lastDigit == 2 && lastDigits != 12)
            suffix = "nd";
        
        if (lastDigit == 3 && lastDigits != 13)
            suffix = "rd";


        return $"{name}, you are the {number}{suffix} customer we serve today. Thank you!";
    }
}
