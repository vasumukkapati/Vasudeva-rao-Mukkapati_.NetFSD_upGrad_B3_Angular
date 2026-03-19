using System;

class BankAccount
{
    // Private fields (data hiding)
    private int accountNumber;
    private double balance;

    // Public property for Account Number (read-only)
    public int AccountNumber
    {
        get { return accountNumber; }
        set { accountNumber = value; }
    }

    // Public property for Balance (read-only from outside)
    public double Balance
    {
        get { return balance; }
    }

    // Constructor
    public BankAccount(int accNo, double initialBalance)
    {
        accountNumber = accNo;
        balance = initialBalance;
    }

    // Deposit method
    public void Deposit(double amount)
    {
        if (amount <= 0)
        {
            Console.WriteLine("Invalid deposit amount!");
            return;
        }

        balance += amount;
        Console.WriteLine("Deposited: " + amount);
    }

    // Withdraw method
    public void Withdraw(double amount)
    {
        if (amount <= 0)
        {
            Console.WriteLine("Invalid withdrawal amount!");
            return;
        }

        if (amount > balance)
        {
            Console.WriteLine("Insufficient balance!");
            return;
        }

        balance -= amount;
        Console.WriteLine("Withdrawn: " + amount);
    }
}

class Program
{
    static void Main()
    {
        // Create account
        BankAccount acc = new BankAccount(101, 0);

        // Sample input
        acc.Deposit(5000);
        acc.Withdraw(2000);

        // Display balance
        Console.WriteLine("Current Balance = " + acc.Balance);
    }
}