using System;
using System.IO;
using System.Text;

class Program
{
    static void Main(string[] args)
    {
        string filePath = "log.txt";

        Console.WriteLine("Enter messages (type 'exit' to stop):");

        while (true)
        {
            Console.Write("Message: ");
            string message = Console.ReadLine();

            if (message.ToLower() == "exit")
                break;

            try
            {
                // Convert string to byte array
                byte[] data = Encoding.UTF8.GetBytes(message + Environment.NewLine);

                // Open file in Append mode
                using (FileStream fs = new FileStream(filePath, FileMode.Append, FileAccess.Write))
                {
                    fs.Write(data, 0, data.Length);
                }

                Console.WriteLine("Message saved successfully.\n");
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error writing to file: " + ex.Message);
            }
        }

        Console.WriteLine("Program ended.");
    }
}