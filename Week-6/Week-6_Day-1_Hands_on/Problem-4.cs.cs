using System;
using System.Threading.Tasks;

class Program
{
    static async Task Main(string[] args)
    {
        Console.WriteLine("Order Processing Started...\n");

        // Execute steps in sequence but asynchronously
        bool paymentStatus = await VerifyPaymentAsync();

        if (paymentStatus)
        {
            bool inventoryStatus = await CheckInventoryAsync();

            if (inventoryStatus)
            {
                await ConfirmOrderAsync();
            }
            else
            {
                Console.WriteLine("Order Failed: Item out of stock.");
            }
        }
        else
        {
            Console.WriteLine("Order Failed: Payment verification failed.");
        }

        Console.WriteLine("\nOrder Processing Finished.");
    }

    // Step 1: Payment Verification
    static async Task<bool> VerifyPaymentAsync()
    {
        Console.WriteLine("Verifying Payment...");
        await Task.Delay(2000); // Simulate delay
        Console.WriteLine("Payment Verified ✅");
        return true; // Change to false to test failure
    }

    // Step 2: Inventory Check
    static async Task<bool> CheckInventoryAsync()
    {
        Console.WriteLine("Checking Inventory...");
        await Task.Delay(1500); // Simulate delay
        Console.WriteLine("Inventory Available ");
        return true; // Change to false to test failure
    }

    // Step 3: Order Confirmation
    static async Task ConfirmOrderAsync()
    {
        Console.WriteLine("Confirming Order...");
        await Task.Delay(1000); // Simulate delay
        Console.WriteLine("Order Confirmed ");
    }
}