//
//  HomeView.swift
//  CurrencyConverter
//
//  Created by Ngô Nam on 23/10/2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = CurrencyViewModel()
    
    var body: some View {
        VStack {
            
            if viewModel.isLoading {
                Spacer()
                ProgressView("Loading...")
                    .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                    .padding()
            }
            
            Text("Currency Converter")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 20)
            
            HStack {
                Picker("From", selection: $viewModel.fromCurrency) {
                    ForEach(viewModel.currencies, id: \.self) { currency in
                        Text(currency).tag(currency)
                            .foregroundColor(Color.customText)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .padding()
                .background(Color(UIColor.systemGray6))
                .cornerRadius(8)
                
                Spacer()
                
                Image(systemName: "arrowshape.right.fill")
                    .font(.largeTitle)
                    .foregroundColor(.blue)
                    .opacity(0.8)
                    .padding()
                
                Spacer()
                
                Picker("To", selection: $viewModel.toCurrency) {
                    ForEach(viewModel.currencies, id: \.self) { currency in
                        Text(currency).tag(currency)
                            .foregroundColor(Color.customText)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .padding()
                .background(Color(UIColor.systemGray6))
                .cornerRadius(8)
            }
            .padding(.vertical)
            .padding()
            
            TextField("Amount", text: $viewModel.amount)
                .keyboardType(.decimalPad)
                .padding()
                .background(Color.customBackground)
                .cornerRadius(8)
                .padding(.horizontal)
                .padding(.bottom)
            
            Button(action: {
                viewModel.convertCurrency()
            }) {
                Text("Convert")
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .padding()
            
            Text("Result: \(viewModel.result, specifier: "%.2f")")
                .font(.headline)
                .padding(.top)
            
            Spacer()
            
            if viewModel.showError {
                Toast(message: viewModel.errorMessage)
                    .padding(.bottom, 20)
            }
        }
        .padding()
        .background(Color(UIColor.systemGray6))
        .onAppear {
            viewModel.fetchExchangeRate()
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    HomeView()
}
