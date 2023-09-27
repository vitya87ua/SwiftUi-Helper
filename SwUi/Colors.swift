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
