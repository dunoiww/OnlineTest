//
//  Inventory.cpp
//  ProductInventoryManagement
//
//  Created by Ngô Nam on 25/10/2024.
//

#include "Inventory.hpp"
#include <iostream>

using namespace std;

void Inventory::setProduct()
{
    cin >> n;
    products = new Product *[n];
    for (int i = 0; i < n; i++)
    {
        products[i] = new Product();
        products[i]->setProduct();
    }
};

void Inventory::setSampleProduct()
{
    n = 4;
    products = new Product *[n];
    products[0] = new Product("Laptop", 999.99, 5);
    products[1] = new Product("Smartphone", 499.99, 10);
    products[2] = new Product("Tablet", 299.99, 0);
    products[3] = new Product("Smartwatch", 199.99, 3);
};

void Inventory::print() {
    for (int i = 0; i < n; i++) {
        products[i]->print();
    }
}

double Inventory::getInventoryValue()
{
    double total = 0;
    for (int i = 0; i < n; i++)
    {
        total += products[i]->getPrice() * products[i]->getQuantity();
    }
    return total;
};

string Inventory::getMostExpensiveProduct()
{
    double max = 0;
    string name;
    for (int i = 0; i < n; i++)
    {
        if (products[i]->getPrice() > max)
        {
            max = products[i]->getPrice();
            name = products[i]->getName();
        }
    }
    return name;
};

bool Inventory::productIsInStock()
{
    cout << "Enter the name of the product to check is in stock: ";
    string name;
    cin >> name;
    for (int i = 0; i < n; i++)
    {
        if (products[i]->getName() == name && products[i]->getQuantity() > 0)
        {
            return true;
        }
    }
    return false;
};

void Inventory::sortProduct()
{
    cout << "Sort by Price or Quantity?" << endl;
    cout << "1. Price" << endl;
    cout << "2. Quantity" << endl;
    int choice;
    cin >> choice;
    switch (choice)
    {
        case 1:
            for (int i = 0; i < n; i++)
            {
                for (int j = i + 1; j < n; j++)
                {
                    if (products[i]->getPrice() > products[j]->getPrice())
                    {
                        Product *temp = products[i];
                        products[i] = products[j];
                        products[j] = temp;
                    }
                }
            }
            break;

        case 2:
            for (int i = 0; i < n; i++)
            {
                for (int j = i + 1; j < n; j++)
                {
                    if (products[i]->getQuantity() > products[j]->getQuantity())
                    {
                        Product *temp = products[i];
                        products[i] = products[j];
                        products[j] = temp;
                    }
                }
            }
            break;

        default:
            cout << "Invalid choice" << endl;
            break;
    }
};
