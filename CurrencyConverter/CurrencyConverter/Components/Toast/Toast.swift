//
//  Toast.swift
//  CurrencyConverter
//
//  Created by Ngô Nam on 23/10/2024.
//

import SwiftUI

struct Toast: View {
    let message: String
    var body: some View {
        Text(message)
            .foregroundColor(.white)
            .padding()
            .background(Color.black.opacity(0.8))
            .cornerRadius(10)
            .frame(maxWidth: .infinity)
            .shadow(radius: 10)
    }
}

#Preview {
    Toast(message: "Lỗi")
}
