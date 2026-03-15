using System;

class Calculator
{
    public int Add(int a, int b)
    {
        return a + b;
    }

    public int Subtract(int a, int b)
    {
        return a - b;
    }
}

class Program
{
    static void Main()
    {
        int num1, num2;

        Console.Write("Enter First Number: ");
        num1 = Convert.ToInt32(Console.ReadLine());

        Console.Write("Enter Second Number: ");
        num2 = Convert.ToInt32(Console.ReadLine());

        Calculator calc = new Calculator();

        int addition = calc.Add(num1, num2);
        int subtraction = calc.Subtract(num1, num2);

        Console.WriteLine("Addition = " + addition);
        Console.WriteLine("Subtraction = " + subtraction);

        Console.ReadLine();
    }
}