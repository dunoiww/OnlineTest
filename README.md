
# Challegen 1: Currency Converter

**Structure of the project**

Model (Data and logic):
* Currency Model:
    Represents the currency conversion information, including the currency type and the amount to be converted.
* API Model:
    Models the data received from the API (e.g., exchange rates).
ViewModel (Logic and data handling):
* CurrencyViewModel:
    * Manages the core logic: calling the API to fetch exchange rates and performing conversions.
    * Stores the state: list of currencies, conversion result, and error handling.
    * Handles asynchronous tasks using Combine.
    * Uses @Published properties to automatically update the View when data changes.
View (User interface):
* Home view 
    * Provides the interface for users to select currencies and enter the amount to be converted.
    * Displays a ProgressView while data is loading.
    * Shows the conversion result in real-time.
    * If an error occurs (e.g., network issue), a Toast notification is displayed.

**Unit test**
* I have added unit tests to test main functionality of the application.
* To run Unit test:
```cmd + U```

**Step to build and run the app**

* Clone the project from the github: https://github.com/dunoiww/OnlineTest.
* Open the folder CurrencyConverter by the Xcode.
* Click Run to build the project.

## Challegen 2
**Question 2.1: Product Inventory Management**

**Question 2.1: Array Manipulation and Missing Number Problem**
+ In this question, I calculate the sum of natural numbers from 1 to n + 1 and the sum of the numbers in the array, then the result is the difference of these 2 sums.

### Demo

+ Currency Converter: https://drive.google.com/file/d/1i0XbthLS1lEILaTtVGQ28x4t5vQQEc3o/view?usp=sharing

+ Product Inventory Management: https://drive.google.com/file/d/1UhFaldzUByuN8yxcG25mEQVdmH2JHJNq/view?usp=sharing

+ Array Manipulation and Missing Number Problem: https://drive.google.com/file/d/1ykmAGvDZid2AywgroMcOrFCQb_W-ySz5/view?usp=sharing