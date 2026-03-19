using System;

// Base class
class Employee
{
    public string Name { get; set; }
    public double BaseSalary { get; set; }

    // Virtual method
    public virtual double CalculateSalary()
    {
        return BaseSalary;
    }
}

// Derived class: Manager
class Manager : Employee
{
    public override double CalculateSalary()
    {
        // 20% bonus
        return BaseSalary + (BaseSalary * 0.20);
    }
}

// Derived class: Developer
class Developer : Employee
{
    public override double CalculateSalary()
    {
        // 10% bonus
        return BaseSalary + (BaseSalary * 0.10);
    }
}

class Program
{
    static void Main()
    {
        double baseSalary = 50000;

        // Base class reference (Polymorphism)
        Employee emp1 = new Manager();
        emp1.Name = "Manager";
        emp1.BaseSalary = baseSalary;

        Employee emp2 = new Developer();
        emp2.Name = "Developer";
        emp2.BaseSalary = baseSalary;

        Console.WriteLine("Manager Salary = " + emp1.CalculateSalary());
        Console.WriteLine("Developer Salary = " + emp2.CalculateSalary());
    }
}