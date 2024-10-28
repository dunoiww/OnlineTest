//
//  WelcomeView.swift
//  CurrencyConverter
//
//  Created by Ngô Nam on 24/10/2024.
//

import SwiftUI

struct WelcomeView: View {
    @State private var rotation: Double = 0
    @State private var offset: CGFloat = 0

    var body: some View {
        ZStack {
            Color.purple.opacity(0.8)
                .ignoresSafeArea()
            
            GeometryReader { geometry in
                VStack {
                    Spacer()
                    
                    Text("Currency Converter")
                        .fontWeight(.bold)
                        .font(.system(size: 30))
                    
                    Image("icon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .padding(.top, 10)
                        .rotationEffect(.degrees(rotation))
                        .offset(y: offset)
                        .animation(.easeInOut(duration: 0.5).repeatForever(autoreverses: true), value: offset)
                        .onAppear {
                            withAnimation(Animation.linear(duration: 3).repeatForever(autoreverses: false)) {
                                rotation = 360
                            }
                            offset = -20
                        }

                    Spacer()
                    
                    NavigationLink(destination: HomeView()) {
                        Text("Start")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                             
                    }
                    .padding(.horizontal)
                    Spacer()
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
            }
        }
    }
}

#Preview {
    WelcomeView()
}
