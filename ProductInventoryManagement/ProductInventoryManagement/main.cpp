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
    
    int n;
    do {
        cout << "\nWelcome to Inventory Management" << endl;
        cout << "1. Total value of the inventory." << endl;
        cout << "2. The most expensive product." << endl;
        cout << "3. Check the product is in stock." << endl;
        cout << "4. Sort the inventory." << endl;
        cout << "5. Exit." << endl;
        
        cin >> n;
        
        switch (n) {
            case 1:
                cout << "The total value of the inventory is: " << inventory.getInventoryValue() << endl;
                break;
            case 2:
                cout << "The most expensive product is: " << inventory.getMostExpensiveProduct() << endl;
                break;
            case 3: {
                string result = inventory.productIsInStock() ? "true" : "false";
                cout << result << endl;
                break;
            }
            case 4:
                inventory.sortProduct();
                cout << "The list products after sort: " << endl;
                inventory.print();
            default:
                break;
        }
    } while (n != 5 && n <= 5);
    return 0;
}
