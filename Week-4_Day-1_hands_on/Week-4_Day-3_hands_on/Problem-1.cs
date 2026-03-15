using System;

class Program
{
    static void Main()
    {
        // Declare variables
        string name;
        int marks;

        // Taking student name
        Console.Write("Enter Name: ");
        name = Console.ReadLine();

        // Taking marks input
        Console.Write("Enter Marks: ");
        marks = Convert.ToInt32(Console.ReadLine());

        // Check for invalid marks
        if (marks < 0 || marks > 100)
        {
            Console.WriteLine("Invalid marks! Marks should be between 0 and 100.");
        }
        else
        {
            // Determine grade using if-else
            if (marks >= 90)
            {
                Console.WriteLine("Student: " + name);
                Console.WriteLine("Grade: A");
            }
            else if (marks >= 75)
            {
                Console.WriteLine("Student: " + name);
                Console.WriteLine("Grade: B");
            }
            else if (marks >= 60)
            {
                Console.WriteLine("Student: " + name);
                Console.WriteLine("Grade: C");
            }
            else if (marks >= 40)
            {
                Console.WriteLine("Student: " + name);
                Console.WriteLine("Grade: D");
            }
            else
            {
                Console.WriteLine("Student: " + name);
                Console.WriteLine("Grade: Fail");
            }
        }
    }
}