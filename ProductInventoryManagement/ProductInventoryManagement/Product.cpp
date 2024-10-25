//
//  Product.cpp
//  ProductInventoryManagement
//
//  Created by Ngô Nam on 25/10/2024.
//

#include "Product.hpp"
#include <iostream>

using namespace std;

void Product::setProduct() {
    cout << "Enter the name of the product: ";
    cin >> name;
    cout << "Enter the price of the product: ";
    cin >> price;
    cout << "Enter the quantity of the product: ";
    cin >> quantity;
    cout << endl;
};

void Product::print() {
    cout << name << ", " << price << ", " << quantity << endl;
}

double Product::getPrice() {
    return price;
};

int Product::getQuantity() {
    return quantity;
};

string Product::getName() {
    return name;
};
