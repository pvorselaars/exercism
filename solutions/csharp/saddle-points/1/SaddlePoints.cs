public static class SaddlePoints
{
    public static IEnumerable<(int, int)> Calculate(int[,] matrix)
    {
        var rows = matrix.GetLength(0);
        var cols = matrix.GetLength(1);

        IEnumerable<(int, int)> result = [];
        
        int[] rowMax = new int[rows];
        int[] colMin = new int[cols];

        for (int i = 0; i < rows; i++)
        {
            rowMax[i] = matrix[i, 0];

            for (int j = 1; j < cols; j++)
            {
                rowMax[i] = Math.Max(rowMax[i], matrix[i, j]);
            }
        }

        for (int j = 0; j < cols; j++)
        {
            colMin[j] = matrix[0, j];

            for (int i = 1; i < rows; i++)
            {
                colMin[j] = Math.Min(colMin[j], matrix[i, j]);
            }
        }

        for (int i = 0; i < rows; i++)
        {
            for (int j = 0; j < cols; j++)
            {
                if (matrix[i, j] == rowMax[i] && matrix[i, j] == colMin[j])
                {
                    result = result.Append((i+1, j+1));
                }
            }
        }

        return result;
    }
}
