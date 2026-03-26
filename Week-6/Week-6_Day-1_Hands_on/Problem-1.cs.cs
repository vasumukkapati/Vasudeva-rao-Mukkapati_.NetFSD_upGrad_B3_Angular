using System;
using System.Threading.Tasks;

namespace AsyncFileLogger
{
    class Program
    {
        static async Task Main(string[] args)
        {
            Console.WriteLine("Application Started...\n");

            // Call async logging multiple times
            Task task1 = WriteLogAsync("Log 1: User logged in");
            Task task2 = WriteLogAsync("Log 2: Data loaded");
            Task task3 = WriteLogAsync("Log 3: Process completed");

            Console.WriteLine("Logging in progress...\n");

            // Wait for all tasks to complete
            await Task.WhenAll(task1, task2, task3);

            Console.WriteLine("\nAll logs written successfully.");
        }

        // Asynchronous method
        static async Task WriteLogAsync(string message)
        {
            Console.WriteLine($"Start Writing: {message}");

            // Simulate file writing delay (I/O operation)
            await Task.Delay(2000);

            Console.WriteLine($"Finished Writing: {message}");
        }
    }
}