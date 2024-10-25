//
//  main.cpp
//  ProductInventoryManagement
//
//  Created by Ngô Nam on 25/10/2024.
//

#include <iostream>
#include "Inventory.hpp"

using namespace std;

int main(int argc, const char *argv[]) {
    Inventory inventory;
    inventory.setSampleProduct();
    cout << "The total value of the inventory is: " << inventory.getInventoryValue() << endl;
    cout << "The most expensive product is: " << inventory.getMostExpensiveProduct() << endl;
    string result = inventory.productIsInStock() ? "true" : "false";
    cout << result << endl;
    inventory.print();
    inventory.sortProduct();
    inventory.print();
    return 0;
}
