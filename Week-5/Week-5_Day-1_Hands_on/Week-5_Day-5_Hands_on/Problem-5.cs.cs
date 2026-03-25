using System;
using System.IO;

class Program
{
    static void Main()
    {
        try
        {
            // Get all drives
            DriveInfo[] drives = DriveInfo.GetDrives();

            Console.WriteLine("\n--- Drive Information ---\n");

            foreach (DriveInfo drive in drives)
            {
                // Check if drive is ready
                if (!drive.IsReady)
                {
                    Console.WriteLine($"Drive {drive.Name} is not ready.");
                    Console.WriteLine("----------------------------------");
                    continue;
                }

                // Get details
                string name = drive.Name;
                string type = drive.DriveType.ToString();
                double totalSize = drive.TotalSize / (1024.0 * 1024 * 1024); // GB
                double freeSpace = drive.AvailableFreeSpace / (1024.0 * 1024 * 1024); // GB

                // Calculate free space percentage
                double freePercent = (drive.AvailableFreeSpace * 100.0) / drive.TotalSize;

                // Display details
                Console.WriteLine($"Drive Name: {name}");
                Console.WriteLine($"Drive Type: {type}");
                Console.WriteLine($"Total Size: {totalSize:F2} GB");
                Console.WriteLine($"Free Space: {freeSpace:F2} GB");
                Console.WriteLine($"Free Space %: {freePercent:F2}%");

                // Warning condition
                if (freePercent < 15)
                {
                    Console.WriteLine("⚠ Warning: Low Disk Space!");
                }

                Console.WriteLine("----------------------------------");
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine("Error: " + ex.Message);
        }
    }
}