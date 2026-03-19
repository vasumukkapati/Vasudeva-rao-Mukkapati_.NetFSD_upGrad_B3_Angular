using System;

// Base class
class Vehicle
{
    private string brand;
    private double rentalRatePerDay;

    // Property for Brand
    public string Brand
    {
        get { return brand; }
        set { brand = value; }
    }

    // Property for RentalRatePerDay (validation)
    public double RentalRatePerDay
    {
        get { return rentalRatePerDay; }
        set
        {
            if (value < 0)
            {
                Console.WriteLine("Rate cannot be negative!");
            }
            else
            {
                rentalRatePerDay = value;
            }
        }
    }

    // Virtual method
    public virtual double CalculateRental(int days)
    {
        return rentalRatePerDay * days;
    }
}

// Derived class: Car
class Car : Vehicle
{
    public override double CalculateRental(int days)
    {
        if (days <= 0)
        {
            Console.WriteLine("Invalid number of days!");
            return 0;
        }

        // Base rent + 500 insurance
        return (RentalRatePerDay * days) + 500;
    }
}

// Derived class: Bike
class Bike : Vehicle
{
    public override double CalculateRental(int days)
    {
        if (days <= 0)
        {
            Console.WriteLine("Invalid number of days!");
            return 0;
        }

        double total = RentalRatePerDay * days;
        double discount = total * 0.05; // 5% discount

        return total - discount;
    }
}

class Program
{
    static void Main()
    {
        int days = 3;

        // Polymorphism
        Vehicle v1 = new Car();
        v1.Brand = "Car";
        v1.RentalRatePerDay = 2000;

        double carTotal = v1.CalculateRental(days);
        Console.WriteLine("Car Total Rental = " + carTotal);

        Vehicle v2 = new Bike();
        v2.Brand = "Bike";
        v2.RentalRatePerDay = 1000;

        double bikeTotal = v2.CalculateRental(days);
        Console.WriteLine("Bike Total Rental = " + bikeTotal);
    }
}