//
//  Colors.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 12.10.2021.
//

import SwiftUI

struct Colors: View {

    let colors: [Color] = [
        .turquoiseBlue, .eastBay, .scooter, .citrine, .corn, .burntSienna,
        .deepCarrotOrange, .roseBudCherry, .jazzberryJam, .wildSand, .birdFlower,
        .violaFlover, .eggPlant, .magentaLight, .magentaDark, .lynch, .lightGray,
        .lightSand, .neroBlack, .darkGraphite, .cinder, .windRush, .timberWolf
    ]

    var body: some View {
        VStack {
            List(colors, id: \.self) { color in
                HStack {
                    Image(systemName: "car")
                    Text("Car")
                    Circle()
                }
                .foregroundColor(color)
            }
        }
        .font(.system(size: 45))
    }
}

#if DEBUG
struct Colors_Previews: PreviewProvider {
    static var previews: some View {
        Colors()
    }
}
#endif

extension Color {

    static var turquoiseBlue: Color {
        Color(hex: "#66EBF6")
    }

    static var eastBay: Color {
        Color(hex: "#44526C")
    }

    static var scooter: Color {
        Color(hex: "#36D2EA")
    }

    static var citrine: Color {
        Color(hex: "#ECC908")
    }

    static var corn: Color {
        Color(hex: "#EBC200")
    }

    static var burntSienna: Color {
        Color(hex: "#FF753F")
    }

    static var deepCarrotOrange: Color {
        Color(hex: "#EE6029")
    }

    static var roseBudCherry: Color {
        Color(hex: "#890E3F")
    }

    static var jazzberryJam: Color {
        Color(hex: "#A6124D")
    }

    static var stateGray: Color {
        Color(hex: "#727D91")
    }

    static var wildSand: Color {
        Color(hex: "#F4F4F4")
    }

    static var birdFlower: Color {
        Color(hex: "#CAD619")
    }

    static var violaFlover: Color {
        Color(hex: "#A184FF")
    }

    static var eggPlant: Color {
        Color(hex: "#152437")
    }

    static var magentaLight: Color {
        Color(hex: "#F44084")
    }

    static var magentaDark: Color {
        Color(hex: "#D73774")
    }

    static var lynch: Color {
        Color(hex: "#6A849D")
    }
    
    static var lightGray: Color {
        Color(hex: "#DDDDDD")
    }
    
    static var lightSand: Color {
        Color(hex: "#EEEAE5")
    }
    
    static var neroBlack: Color {
        Color(hex: "#161616")
    }
    
    static var darkGraphite: Color {
        Color(hex: "#202020")
    }
    
    static var cinder: Color {
        Color(hex: "#696868")
    }
    
    static var windRush: Color {
        Color(hex: "#DCD2C7")
    }
    
    static var timberWolf: Color {
        Color(hex: "#DAD9D7")
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
    
    // Convert Color to hex(String)
    var hex: String? {
        let uic = UIColor(self)
        
        guard
            let components = uic.cgColor.components,
                components.count >= 3
        else {
            return nil
        }
        let r = Float(components[0])
        let g = Float(components[1])
        let b = Float(components[2])
        var a = Float(1.0)

        if components.count >= 4 {
            a = Float(components[3])
        }

        if a != Float(1.0) {
            return String(
                format: "%02lX%02lX%02lX%02lX",
                lroundf(r * 255),
                lroundf(g * 255),
                lroundf(b * 255),
                lroundf(a * 255))
        } else {
            return String(
                format: "%02lX%02lX%02lX",
                lroundf(r * 255),
                lroundf(g * 255),
                lroundf(b * 255))
        }
    }
}
