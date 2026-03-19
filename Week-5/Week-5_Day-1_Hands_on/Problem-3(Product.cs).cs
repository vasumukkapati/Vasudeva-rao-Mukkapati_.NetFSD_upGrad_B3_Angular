using System;

// Base class
class Product
{
    private string name;
    private double price;

    // Property for Name
    public string Name
    {
        get { return name; }
        set { name = value; }
    }

    // Property for Price (with validation)
    public double Price
    {
        get { return price; }
        set
        {
            if (value < 0)
            {
                Console.WriteLine("Price cannot be negative!");
            }
            else
            {
                price = value;
            }
        }
    }

    // Virtual method
    public virtual double CalculateDiscount()
    {
        return 0; // No discount in base class
    }
}

// Derived class: Electronics
class Electronics : Product
{
    public override double CalculateDiscount()
    {
        return Price * 0.05; // 5% discount
    }
}

// Derived class: Clothing
class Clothing : Product
{
    public override double CalculateDiscount()
    {
        return Price * 0.15; // 15% discount
    }
}

class Program
{
    static void Main()
    {
        // Example: Electronics
        Product p = new Electronics();
        p.Name = "Laptop";
        p.Price = 20000;

        double discount = p.CalculateDiscount();
        double finalPrice = p.Price - discount;

        Console.WriteLine("Product: " + p.Name);
        Console.WriteLine("Original Price = " + p.Price);
        Console.WriteLine("Discount = " + discount);
        Console.WriteLine("Final Price = " + finalPrice);
    }
}