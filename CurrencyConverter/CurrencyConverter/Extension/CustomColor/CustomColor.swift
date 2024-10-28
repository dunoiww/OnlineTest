//
//  CustomColor.swift
//  CurrencyConverter
//
//  Created by Ngô Nam on 24/10/2024.
//

import Foundation
import SwiftUI

extension Color {
    static let customBackground = Color(UIColor { trait in
        return trait.userInterfaceStyle == .dark ? UIColor.black : UIColor.white
    })
    
    static let customText = Color(UIColor {trait in
        return trait.userInterfaceStyle == .dark ? UIColor.white : UIColor.black
    })
}
