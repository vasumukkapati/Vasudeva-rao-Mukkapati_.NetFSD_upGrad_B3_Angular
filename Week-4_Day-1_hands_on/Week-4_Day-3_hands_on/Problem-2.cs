using System;

class Class1
{
    public static void Calculator()
    {
        double num1, num2, result;
        char op;

        Console.Write("Enter First Number: ");
        num1 = Convert.ToDouble(Console.ReadLine());

        Console.Write("Enter Second Number: ");
        num2 = Convert.ToDouble(Console.ReadLine());

        Console.Write("Enter Operator (+, -, *, /): ");
        op = Convert.ToChar(Console.ReadLine());

        switch (op)
        {
            case '+':
                result = num1 + num2;
                Console.WriteLine("Result: " + result);
                break;

            case '-':
                result = num1 - num2;
                Console.WriteLine("Result: " + result);
                break;

            case '*':
                result = num1 * num2;
                Console.WriteLine("Result: " + result);
                break;

            case '/':
                if (num2 == 0)
                {
                    Console.WriteLine("Division by zero not allowed");
                }
                else
                {
                    result = num1 / num2;
                    Console.WriteLine("Result: " + result);
                }
                break;

            default:
                Console.WriteLine("Invalid Operator");
                break;
        }

        Console.ReadLine();
    }
}