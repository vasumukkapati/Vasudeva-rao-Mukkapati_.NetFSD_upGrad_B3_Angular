using LinqCodeTemplate;

class Program
{
    static void Main()
    {
        Product p = new Product();
        var products = p.GetProducts();

        // 1. FMCG products
        var q1 = products.Where(x => x.ProCategory == "FMCG");

        // 2. Grain products
        var q2 = products.Where(x => x.ProCategory == "Grain");

        // 3. Sort by Product Code (Ascending)
        var q3 = products.OrderBy(x => x.ProCode);

        // 4. Sort by Category
        var q4 = products.OrderBy(x => x.ProCategory);

        // 5. Sort by MRP (Ascending)
        var q5 = products.OrderBy(x => x.ProMrp);

        // 6. Sort by MRP (Descending)
        var q6 = products.OrderByDescending(x => x.ProMrp);

        // 7. Group by Category
        var q7 = products.GroupBy(x => x.ProCategory);

        // 8. Group by MRP
        var q8 = products.GroupBy(x => x.ProMrp);

        // 9. Highest price in FMCG
        var q9 = products
                    .Where(x => x.ProCategory == "FMCG")
                    .OrderByDescending(x => x.ProMrp)
                    .FirstOrDefault();

        // 10. Count total products
        var q10 = products.Count();

        // 11. Count FMCG products
        var q11 = products.Count(x => x.ProCategory == "FMCG");

        // 12. Max price
        var q12 = products.Max(x => x.ProMrp);

        // 13. Min price
        var q13 = products.Min(x => x.ProMrp);

        // 14. All products below 30
        var q14 = products.All(x => x.ProMrp < 30);

        // 15. Any product below 30
        var q15 = products.Any(x => x.ProMrp < 30);

        // Display sample outputs
        Console.WriteLine("FMCG Products:");
        foreach (var item in q1)
            Console.WriteLine(item.ProName);

        Console.WriteLine($"\nTotal Count: {q10}");
        Console.WriteLine($"FMCG Count: {q11}");
        Console.WriteLine($"Max Price: {q12}");
        Console.WriteLine($"Min Price: {q13}");
        Console.WriteLine($"All < 30: {q14}");
        Console.WriteLine($"Any < 30: {q15}");

        Console.ReadLine();
    }
}