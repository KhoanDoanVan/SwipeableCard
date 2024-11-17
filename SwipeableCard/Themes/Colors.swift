//
//  Colors.swift
//  SwipeableCard
//
//  Created by Đoàn Văn Khoan on 17/11/24.
//

import SwiftUI

extension Color {
    
    /// Hex color initialize
    init(hex: String, opacity: Double = 1.0) {
        let hexSanitized = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        
        let red = Double((rgb & 0xFF0000) >> 16) / 255.0
        let green = Double((rgb & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgb & 0x0000FF) / 255.0
        
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
    }
    
    /// Brand Colors
    static let primaryColor = Color(hex: "#FF4356")
    static let secondaryColor = Color(hex: "#FF7854")
    static let backgroundColor = Color(hex: "#F5F5F5")
    static let iconColor = Color(hex: "#BACBA9")
    
    /// Button
    static let buttonColor = Color(hex: "#FF6C8D")
    static let activeColor = Color(hex: "#005A40")
    static let activeLightColor = Color(hex: "#E3FEE5")
    static let buttonGrayColor = Color(hex: "#595D63")
}
