using System;
using System.Collections.Generic;

namespace ConsoleApp16
{
    class TaskName
    {
        // Add Task
        public static void AddTask(List<string> tasks)
        {
            Console.Write("Enter task: ");
            string task = Console.ReadLine();

            if (!string.IsNullOrWhiteSpace(task))
            {
                tasks.Add(task);
                Console.WriteLine("Task added!");
            }
            else
            {
                Console.WriteLine("Task cannot be empty.");
            }
        }

        // View Tasks
        public static void ViewTasks(List<string> tasks)
        {
            if (tasks.Count == 0)
            {
                Console.WriteLine("No tasks available.");
                return;
            }

            Console.WriteLine("\nTasks:");
            for (int i = 0; i < tasks.Count; i++)
            {
                Console.WriteLine($"{i + 1}. {tasks[i]}");
            }
        }

        // Remove Task
        public static void RemoveTask(List<string> tasks)
        {
            if (tasks.Count == 0)
            {
                Console.WriteLine("No tasks to remove.");
                return;
            }

            Console.Write("Enter task number to remove: ");
            if (int.TryParse(Console.ReadLine(), out int index))
            {
                if (index >= 1 && index <= tasks.Count)
                {
                    string removed = tasks[index - 1];
                    tasks.RemoveAt(index - 1);
                    Console.WriteLine($"Removed: {removed}");
                }
                else
                {
                    Console.WriteLine("Invalid task number.");
                }
            }
            else
            {
                Console.WriteLine("Please enter a valid number.");
            }
        }
    }
}