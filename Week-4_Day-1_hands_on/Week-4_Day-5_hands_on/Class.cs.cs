using System;

class Program
{
    static void Main()
    {
        try
        {
            var emp = new Employee("Marko Horvat", 4500m, 35);

            Console.WriteLine($"ID: {emp.EmployeeId}");
            Console.WriteLine($"Salary: {emp.Salary}");

            emp.GiveRaise(15);

            emp.FullName = "Marko Horvat Jr.";
            Console.WriteLine($"Name: {emp.FullName}");

            Console.WriteLine($"Age: {emp.Age}");

            bool result = emp.DeductPenalty(1000);
            Console.WriteLine(result ? "Penalty applied" : "Penalty rejected");

            Console.WriteLine($"Final Salary: {emp.Salary}");
        }
        catch (Exception ex)
        {
            Console.WriteLine(ex.Message);
        }
    }
}
