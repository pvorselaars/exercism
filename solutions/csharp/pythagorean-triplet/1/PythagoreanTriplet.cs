public static class PythagoreanTriplet
{
    public static IEnumerable<(int a, int b, int c)> TripletsWithSum(int sum)
    {
        HashSet<(int a, int b, int c)> result = [];

        for (int a = 1; a < sum / 3; a++)
        {
            var numerator = sum * (sum - 2 * a);
            var denominator = 2 * (sum - a);

            if (numerator % denominator == 0)
            {
                var b = numerator / denominator;
                var c = sum - a - b;

                if (a < b && b < c)
                    result.Add((a, b, c));

            }
        }

        return result;
    }
}