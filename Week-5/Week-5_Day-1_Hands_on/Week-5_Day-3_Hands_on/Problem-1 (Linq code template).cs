using System;
using System.Collections.Generic;
using System.Linq;

namespace LinqCodeTemplate
{
    internal class Product
    {
        public int ProCode { get; set; }
        public string ProName { get; set; }
        public string ProCategory { get; set; }
        public int ProMrp { get; set; }

        public List<Product> GetProducts()
        {
            return new List<Product>
            {
                new Product { ProCode = 1, ProName = "Soap", ProCategory = "FMCG", ProMrp = 30 },
                new Product { ProCode = 2, ProName = "Rice", ProCategory = "Grain", ProMrp = 60 },
                new Product { ProCode = 3, ProName = "Shampoo", ProCategory = "FMCG", ProMrp = 120 },
                new Product { ProCode = 4, ProName = "Wheat", ProCategory = "Grain", ProMrp = 40 },
                new Product { ProCode = 5, ProName = "Oil", ProCategory = "FMCG", ProMrp = 150 }
            };
        }
    }
}