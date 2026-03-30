using System;
using System.Collections.Generic;
using System.Data;
using Microsoft.Data.SqlClient;

namespace ConsoleApp20
{
    public class ProductDAL
    {
        private readonly string connectionString =
            "Server=VASU\\SQLEXPRESS;Database=productdb;Integrated Security=True;TrustServerCertificate=True";

        // INSERT
        public void InsertProduct(Product product)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand("sp_InsertProduct", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@ProductName", product.ProductName);
                cmd.Parameters.AddWithValue("@Category", product.Category);
                cmd.Parameters.AddWithValue("@Price", product.Price);

                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        // VIEW
        public List<Product> GetAllProducts()
        {
            List<Product> list = new List<Product>();

            using (SqlConnection con = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand("sp_GetAllProducts", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    Product p = new Product
                    {
                        ProductId = Convert.ToInt32(reader["ProductId"]),
                        ProductName = reader["ProductName"].ToString(),
                        Category = reader["Category"].ToString(),
                        Price = Convert.ToDecimal(reader["Price"])
                    };

                    list.Add(p);
                }
            }

            return list;
        }

        // UPDATE
        public void UpdateProduct(Product product)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand("sp_UpdateProduct", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@ProductId", product.ProductId);
                cmd.Parameters.AddWithValue("@ProductName", product.ProductName);
                cmd.Parameters.AddWithValue("@Category", product.Category);
                cmd.Parameters.AddWithValue("@Price", product.Price);

                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        // DELETE
        public void DeleteProduct(int id)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand("sp_DeleteProduct", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@ProductId", id);

                con.Open();
                cmd.ExecuteNonQuery();
            }
        }
    }
}