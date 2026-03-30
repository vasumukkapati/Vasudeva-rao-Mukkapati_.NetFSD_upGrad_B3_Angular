using System;

namespace ConsoleApp20
{
    class Program
    {
        static void Main()
        {
            ProductDAL dal = new ProductDAL();

            while (true)
            {
                Console.WriteLine("\n1.Insert\n2.View\n3.Update\n4.Delete\n5.Exit");
                Console.Write("Enter choice: ");

                string input = Console.ReadLine().ToLower();

                int choice = input switch
                {
                    "1" => 1,
                    "insert" => 1,
                    "2" => 2,
                    "view" => 2,
                    "3" => 3,
                    "update" => 3,
                    "4" => 4,
                    "delete" => 4,
                    "5" => 5,
                    "exit" => 5,
                    _ => 0
                };

                switch (choice)
                {
                    case 1:
                        Product p = new Product();

                        Console.Write("Name: ");
                        p.ProductName = Console.ReadLine();

                        Console.Write("Category: ");
                        p.Category = Console.ReadLine();

                        Console.Write("Price: ");
                        p.Price = Convert.ToDecimal(Console.ReadLine());

                        dal.InsertProduct(p);
                        Console.WriteLine("Inserted Successfully!");
                        break;

                    case 2:
                        var list = dal.GetAllProducts();

                        foreach (var item in list)
                        {
                            Console.WriteLine($"{item.ProductId} | {item.ProductName} | {item.Category} | {item.Price}");
                        }
                        break;

                    case 3:
                        Product up = new Product();

                        Console.Write("Id: ");
                        up.ProductId = Convert.ToInt32(Console.ReadLine());

                        Console.Write("Name: ");
                        up.ProductName = Console.ReadLine();

                        Console.Write("Category: ");
                        up.Category = Console.ReadLine();

                        Console.Write("Price: ");
                        up.Price = Convert.ToDecimal(Console.ReadLine());

                        dal.UpdateProduct(up);
                        Console.WriteLine("Updated Successfully!");
                        break;

                    case 4:
                        Console.Write("Enter Id: ");
                        int id = Convert.ToInt32(Console.ReadLine());

                        dal.DeleteProduct(id);
                        Console.WriteLine("Deleted Successfully!");
                        break;

                    case 5:
                        Console.WriteLine("Exiting...");
                        return;

                    default:
                        Console.WriteLine("Invalid input! Enter number or valid option.");
                        break;
                }
            }
        }
    }
}