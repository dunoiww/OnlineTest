//
//  Product.hpp
//  ProductInventoryManagement
//
//  Created by Ngô Nam on 25/10/2024.
//

#include <string>
#include <iostream>

using namespace std;

class Product {
protected:
    string name;
    double price;
    int quantity;

public:
    Product() {};
    Product(string name, double price, int quantity) {
        this->name = name;
        this->price = price;
        this->quantity = quantity;
    };
    ~Product() {};

    void setProduct();
    void print();
    double getPrice();
    int getQuantity();
    string getName();
};
