using System;

class Student
{
    public double CalculateAverage(int m1, int m2, int m3)
    {
        double avg = (m1 + m2 + m3) / 3.0;
        return avg;
    }
}

class Class1
{
    static void Main()
    {
        int m1, m2, m3;
        double average;
        string grade;

        Console.Write("Enter Marks 1: ");
        m1 = Convert.ToInt32(Console.ReadLine());

        Console.Write("Enter Marks 2: ");
        m2 = Convert.ToInt32(Console.ReadLine());

        Console.Write("Enter Marks 3: ");
        m3 = Convert.ToInt32(Console.ReadLine());

        Student s = new Student();

        average = s.CalculateAverage(m1, m2, m3);

        if (average >= 80)
            grade = "A";
        else if (average >= 60)
            grade = "B";
        else if (average >= 50)
            grade = "C";
        else
            grade = "Fail";

        Console.WriteLine("Average = " + average);
        Console.WriteLine("Grade = " + grade);

        Console.ReadLine();
    }
}