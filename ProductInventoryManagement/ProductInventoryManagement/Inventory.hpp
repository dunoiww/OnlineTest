//
//  Inventory.hpp
//  ProductInventoryManagement
//
//  Created by Ngô Nam on 25/10/2024.
//

#include "Product.hpp"
#include <iostream>

using namespace std;

class Inventory {
    protected:
        int n;
        Product **products;
    public:
        Inventory() {};
        ~Inventory() {
            for (int i = 0; i < n; i++)
            {
                delete products[i];
            }
            delete [] products;
        };

        void setProduct();
        void setSampleProduct();
        void print();
        double getInventoryValue();
        string getMostExpensiveProduct();
        bool productIsInStock();
        void sortProduct();
};
