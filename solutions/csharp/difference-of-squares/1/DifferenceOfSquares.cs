public static class DifferenceOfSquares
{
    public static int CalculateSquareOfSum(int max)
    {
        var sum = 0;
        for (int i = 1; i <= max; i++)
            sum += i;

        return sum * sum;
    }

    public static int CalculateSumOfSquares(int max)
    {
        var squares = 0;
        for (int i = 1; i <= max; i++)
            squares += i*i;

        return squares;
    }

    public static int CalculateDifferenceOfSquares(int max) => CalculateSquareOfSum(max) - CalculateSumOfSquares(max);
}