using System;
using System.Threading.Tasks;

class Program
{
    static async Task Main(string[] args)
    {
        Console.WriteLine("Starting Report Generation...\n");

        // Run all tasks concurrently
        Task salesTask = Task.Run(() => GenerateSalesReport());
        Task inventoryTask = Task.Run(() => GenerateInventoryReport());
        Task customerTask = Task.Run(() => GenerateCustomerReport());

        // Wait for all tasks to complete
        await Task.WhenAll(salesTask, inventoryTask, customerTask);

        Console.WriteLine("\nAll reports generated successfully!");
    }

    static void GenerateSalesReport()
    {
        Console.WriteLine("Sales Report Started...");
        Task.Delay(3000).Wait(); // Simulating work
        Console.WriteLine("Sales Report Completed!");
    }

    static void GenerateInventoryReport()
    {
        Console.WriteLine("Inventory Report Started...");
        Task.Delay(2000).Wait(); // Simulating work
        Console.WriteLine("Inventory Report Completed!");
    }

    static void GenerateCustomerReport()
    {
        Console.WriteLine("Customer Report Started...");
        Task.Delay(2500).Wait(); // Simulating work
        Console.WriteLine("Customer Report Completed!");
    }
}