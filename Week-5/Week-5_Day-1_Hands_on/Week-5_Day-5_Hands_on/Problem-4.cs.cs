using System;
using System.IO;

class Program
{
    static void Main()
    {
        Console.Write("Enter root directory path: ");
        string path = Console.ReadLine();

        try
        {
            // Check if directory exists
            if (!Directory.Exists(path))
            {
                Console.WriteLine("Invalid directory path.");
                return;
            }

            // Create DirectoryInfo object
            DirectoryInfo root = new DirectoryInfo(path);

            // Get all subdirectories
            DirectoryInfo[] directories = root.GetDirectories();

            Console.WriteLine("\n--- Folder Details ---\n");

            foreach (DirectoryInfo dir in directories)
            {
                try
                {
                    // Count files in each directory
                    FileInfo[] files = dir.GetFiles();
                    int fileCount = files.Length;

                    Console.WriteLine("Folder Name: " + dir.Name);
                    Console.WriteLine("File Count: " + fileCount);
                    Console.WriteLine("-----------------------------");
                }
                catch (Exception ex)
                {
                    // Handle access issues for specific folders
                    Console.WriteLine("Cannot access folder: " + dir.Name);
                    Console.WriteLine("Reason: " + ex.Message);
                    Console.WriteLine("-----------------------------");
                }
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine("Error: " + ex.Message);
        }
    }
}