using System;

public class Employee
{
    // Private fields
    private string _fullName;
    private int _age;
    private decimal _salary;
    private readonly string _employeeId;

    // Properties

    public string FullName
    {
        get => _fullName;
        set
        {
            if (string.IsNullOrWhiteSpace(value))
                throw new ArgumentException("Full name cannot be empty.");

            _fullName = value.Trim();
        }
    }

    public int Age
    {
        get => _age;
        set
        {
            if (value < 18 || value > 80)
                throw new ArgumentException("Age must be between 18 and 80.");

            _age = value;
        }
    }

    public decimal Salary
    {
        get => _salary;
        private set
        {
            if (value < 1000)
                throw new ArgumentException("Salary cannot be less than 1000.");

            _salary = value;
        }
    }

    public string EmployeeId => _employeeId;

    // Constructor
    public Employee(string fullName, decimal salary, int age, string employeeId = null)
    {
        _employeeId = string.IsNullOrWhiteSpace(employeeId)
            ? "E" + Guid.NewGuid().ToString().Substring(0, 5)
            : employeeId;

        FullName = fullName;
        Age = age;
        Salary = salary;
    }

    // Methods

    public void GiveRaise(decimal percentage)
    {
        if (percentage <= 0 || percentage > 30)
            throw new ArgumentException("Raise must be between 0 and 30%.");

        decimal increase = _salary * (percentage / 100);
        Salary = _salary + increase;

        Console.WriteLine($"Salary increased to {Salary}");
    }

    public bool DeductPenalty(decimal amount)
    {
        if (amount <= 0)
            return false;

        decimal newSalary = _salary - amount;

        if (newSalary < 1000)
            return false;

        Salary = newSalary;
        return true;
    }
}
