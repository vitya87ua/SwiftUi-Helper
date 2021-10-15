//
//  CircularProgressView.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 21.07.2021.
//

import SwiftUI

struct ElogMiddleModel: Identifiable {
    let id: UUID = UUID.init()
    let title: String
    let time: Int
    let timeString: String
    let color: Color
}

struct CircularProgressView: View {

    @State var progress: [CGFloat] = [0.25, 0.35, 0.5, 0.8]

    let array = [
        ElogMiddleModel(
            title: "Driving Hours",
            time: 434,
            timeString: "132",
            color: Color(#colorLiteral(red: 0.9703264832, green: 0.8899305463, blue: 0.009040302597, alpha: 1))),
        ElogMiddleModel(
            title: "Work Shift Hour",
            time: 5363,
            timeString: "321",
            color: Color(#colorLiteral(red: 0.007110340986, green: 0.8267522454, blue: 0.885255754, alpha: 1))),
        ElogMiddleModel(
            title: "Cycle 1- South 60°N",
            time: 1463,
            timeString: "232",
            color: Color(#colorLiteral(red: 0.7000405788, green: 0.9225669503, blue: 0.1197191551, alpha: 1))),
        ElogMiddleModel(
            title: "US 70hr/8days",
            time: 3765,
            timeString: "256",
            color: Color(#colorLiteral(red: 0.9922506213, green: 0.7866538167, blue: 0.8828040957, alpha: 1))),
        ElogMiddleModel(
            title: "Onduty Time",
            time: 74574,
            timeString: "323",
            color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
    ]

    var body: some View {

        ZStack {
            backgroundImage
                .overlay(
                    HStack(alignment: .center, spacing: 5) {
                        ProgressCircle(progressValue: array)
                            .padding(.trailing)
                        infoView
                    }
                    .padding(.horizontal)
                )
        }
    }

    private var backgroundImage: some View {
        Image("dark_panel_bg") // orange_panel_bg
            .resizable()
            .scaledToFit()
            .overlay(Image("ic_shipment")
                        .scaleEffect(
                            CGSize(
                                width: 0.50,
                                height: 0.50
                            )
                        ),
                     alignment: .bottomLeading
            )
    }

    private var infoView: some View {
        VStack(spacing: 15) {
            ForEach(array) { model in
                HStack {
                    Text(model.title)
                    Spacer()
                    Text(model.timeString)
                }
                .foregroundColor(model.color)
            }
        }
        .font(.system(size: 13, weight: .bold).italic())
        .foregroundColor(.white)

    }
}
struct ProgressCircle: View {

    let progressValue: [ElogMiddleModel]

    var body: some View {

        GeometryReader(content: { geometry in
            ZStack {
                ForEach(progressValue.indices) { circle in
                    Circle()
                        .stroke(Color.black, lineWidth: lineWidth(diameter: geometry.size.height))
                        .frame(width: calculateDiameter(num: circle, diam: geometry.size.height), height: calculateDiameter(num: circle, diam: geometry.size.height), alignment: .center)
                    Circle()
                        .trim(from: 0.0, to: calculateTrim(num: circle))
                        .stroke(style: StrokeStyle(lineWidth: lineWidth(diameter: geometry.size.height) * 2.5, lineCap: .round, lineJoin: .round))
                        .foregroundColor(setColor(num: circle))
                        .rotationEffect(Angle(degrees: 270))
                        .animation(.linear)
                        .frame(width: calculateDiameter(num: circle, diam: geometry.size.height), height: calculateDiameter(num: circle, diam: geometry.size.height), alignment: .center)
                }
            }
            .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
        })
    }

    private func calculateTrim(num: Int) -> CGFloat {
        CGFloat(Double(progressValue[num].time / 60) / 100)
    }

    private func lineWidth(diameter: CGFloat) -> CGFloat {
        diameter / 100
    }

    private func calculateDiameter(num: Int, diam: CGFloat) -> CGFloat {
        let diam = diam - ((diam / 100) * 10)
        switch num {
        case 0: return diam
        case 1: return (diam / 100) * 83.26
        case 2: return (diam / 100) * 66.6
        case 3: return (diam / 100) * 50
        default: return 0
        }
    }

    private func setColor(num: Int) -> Color {
        switch num {
        case 0: return Color.yellow
        case 1: return Color(.systemTeal)
        case 2: return Color.green
        case 3: return Color.pink
        default: return Color.clear
        }
    }
}

#if DEBUG
struct CircularProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressView()
    }
}
#endif


/*
 struct CircularProgressView: View {

     @State var progress: [CGFloat] = [0.25, 0.35, 0.5, 0.8]

     var body: some View {
         VStack {

             VStack {
                 ProgressCircle(progressValue: progress, diameter: 360)
             }
             .frame(width: 300, height: 300)

         }
     }
 }

 struct ProgressCircle: View {

     let progressValue: [CGFloat]
     let diameter: CGFloat

     var body: some View {

         let lineWidth: CGFloat = diameter / 100

         ZStack {
             ForEach(progressValue.indices) { circle in
                 Circle()
                     .stroke(Color.black, lineWidth: lineWidth)
                     .frame(width: calculateDiameter(num: circle), height: calculateDiameter(num: circle), alignment: .center)
                 Circle()
                     .trim(from: 0.0, to: progressValue[circle])
                     .stroke(style: StrokeStyle(lineWidth: lineWidth * 2.5, lineCap: .round, lineJoin: .round))
                     .foregroundColor(setColor(num: circle))
                     .rotationEffect(Angle(degrees: 270))
                     .animation(.linear)
                     .frame(width: calculateDiameter(num: circle), height: calculateDiameter(num: circle), alignment: .center)
             }
         }
     }

     private func calculateDiameter(num: Int) -> CGFloat {
         switch num {
         case 0: return diameter
         case 1: return (diameter / 100) * 83.26
         case 2: return (diameter / 100) * 66.6
         case 3: return (diameter / 100) * 50
         default: return 0
         }
     }

     private func setColor(num: Int) -> Color {
         switch num {
         case 0: return Color.yellow
         case 1: return Color(.systemTeal)
         case 2: return Color.green
         case 3: return Color.pink
         default: return Color.clear
         }
     }
 }

 #if DEBUG
 struct CircularProgressView_Previews: PreviewProvider {
     static var previews: some View {
         CircularProgressView()
     }
 }
 #endif

 */
