//
//  main.cpp
//  MissingNumberProblem
//
//  Created by Ngô Nam on 25/10/2024.
//

#include <iostream>

using namespace std;

void inputArray (int a[], int n) {
    for (int i = 0; i < n; i++) {
        cin >> a[i];
    }
}

int missingNumber(int a[], int n) {
    int sumOfN = (n + 1) * (n + 2) / 2;
    int sum = 0;
    for (int i = 0; i < n; i++) {
        sum += a[i];
    }
    return sumOfN - sum;
}

int main(int argc, const char * argv[]) {
    int n;
    cin >> n;
    int a[n];
    
    inputArray(a, n);
   
    cout << missingNumber(a, n) << endl;
    
    return 0;
}
