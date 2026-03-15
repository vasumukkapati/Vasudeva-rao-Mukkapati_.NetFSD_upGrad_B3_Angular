using System;

class Class2
{
    static void Main()
    {
        string name;
        double salary, bonus, finalSalary;
        int experience;

        Console.Write("Enter Name: ");
        name = Console.ReadLine();

        Console.Write("Enter Salary: ");
        salary = Convert.ToDouble(Console.ReadLine());

        Console.Write("Enter Experience (years): ");
        experience = Convert.ToInt32(Console.ReadLine());

        // Bonus calculation using if-else
        if (experience < 2)
        {
            bonus = salary * 0.05;
        }
        else if (experience <= 5)
        {
            bonus = salary * 0.10;
        }
        else
        {
            bonus = salary * 0.15;
        }

        finalSalary = salary + bonus;

        Console.WriteLine("\nEmployee: " + name);
        Console.WriteLine("Bonus: " + bonus);
        Console.WriteLine("Final Salary: " + finalSalary);

        Console.ReadLine();
    }
}