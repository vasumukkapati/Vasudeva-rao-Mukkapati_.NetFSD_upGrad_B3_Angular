using System;

class Program
{
    static void Main()
    {
        // Input from user
        Console.Write("Enter Employee Name: ");
        string name = Console.ReadLine();

        Console.Write("Enter Monthly Sales Amount: ");
        double sales = Convert.ToDouble(Console.ReadLine());

        Console.Write("Enter Customer Rating (1-5): ");
        int rating = Convert.ToInt32(Console.ReadLine());

        // Get tuple (Sales, Rating)
        var result = GetEmployeeData(sales, rating);

        // Determine performance using pattern matching
        string performance = result switch
        {
            ( >= 100000, >= 4) => "High Performer",
            ( >= 50000, >= 3) => "Average Performer",
            _ => "Needs Improvement"
        };

        // Display output
        Console.WriteLine("\n--- Employee Details ---");
        Console.WriteLine("Employee Name: " + name);
        Console.WriteLine("Sales Amount: " + result.sales);
        Console.WriteLine("Rating: " + result.rating);
        Console.WriteLine("Performance: " + performance);
    }

    // Method returning tuple
    static (double sales, int rating) GetEmployeeData(double sales, int rating)
    {
        return (sales, rating);
    }
}