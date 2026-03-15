namespace ConsoleApp10
{
    internal class Program
    {

        static void CountVowels(string text)
        {
            int count = 0;
            foreach (char c in text.ToLower())
            {
                if (c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u')
                {
                    count++;
                }
            }
            Console.WriteLine(count);
        }
        static void hello(string[] args)
        {
            CountVowels("Programming");
            Console.ReadLine();
        }
    }
}