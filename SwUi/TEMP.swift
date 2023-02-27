//
//  TEMP.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 01.09.2021.
//

import SwiftUI

struct NewUser: Identifiable {
    var id: String = UUID().uuidString
    var name: String
    var age: Int
}

final class ViewModel: ObservableObject {
    @Published var confIsPres: Bool = false
    
    @Published var users: [NewUser] = [
        NewUser(name: "Ol", age: 12),
        NewUser(name: "Lor", age: 22),
        NewUser(name: "Asr", age: 32),
        NewUser(name: "Oin", age: 42),
        NewUser(name: "Plm", age: 6)
    ]
}

struct TEMP: View {
    
    @State private var show: Bool = false
    @State private var scaleEffect: CGFloat = 0.1
    @State private var opacity: CGFloat = 1 {
        didSet {
//            if opacity == 0 {
//                show = false
//                scaleEffect = 0.1
//                opacity = 1
//            }
        }
    }
    
    var body: some View {
        ZStack {
            Color.yellow
            
            VStack {
                ScaledBezier(bezierPath: .logo2)
                    .stroke(lineWidth: 2)
                    .frame(width: 200, height: 200)
                    .border(Color.red, width: 1)
                
                
                Path(UIBezierPath.logo6.cgPath)
                    .stroke(lineWidth: 2)
                    .frame(width: 200, height: 200)
                    .border(Color.red, width: 1)
                
                Picker("Topping", selection: .constant(Topping.nuts)) {
                        ForEach(Topping.allCases) { topping in
                            Text(topping.rawValue.capitalized)
                        }
                    }
                .pickerStyle(.segmented)
                .colorMultiply(.red)
//                .tint(.red)
//                .foregroundColor(.red)
                
            }
        }
    }
}

#if DEBUG
    struct TEMP_Previews: PreviewProvider {
        static var previews: some View {
            TEMP()
        }
    }
#endif

struct MyViewRep: UIViewRepresentable {
    
    @Binding var backgroundColor: UIColor?
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
//        view.backgroundColor = .red
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        uiView.backgroundColor = backgroundColor
    }
}

extension UIBezierPath {
    /// The Unwrap logo as a Bezier path.
    static var logo: UIBezierPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0.534, y: 0.5816))
        path.addCurve(to: CGPoint(x: 0.1877, y: 0.088), controlPoint1: CGPoint(x: 0.534, y: 0.5816), controlPoint2: CGPoint(x: 0.2529, y: 0.4205))
        path.addCurve(to: CGPoint(x: 0.9728, y: 0.8259), controlPoint1: CGPoint(x: 0.4922, y: 0.4949), controlPoint2: CGPoint(x: 1.0968, y: 0.4148))
        path.addCurve(to: CGPoint(x: 0.0397, y: 0.5431), controlPoint1: CGPoint(x: 0.7118, y: 0.5248), controlPoint2: CGPoint(x: 0.3329, y: 0.7442))
        path.addCurve(to: CGPoint(x: 0.6211, y: 0.0279), controlPoint1: CGPoint(x: 0.508, y: 1.1956), controlPoint2: CGPoint(x: 1.3042, y: 0.5345))
        path.addCurve(to: CGPoint(x: 0.6904, y: 0.3615), controlPoint1: CGPoint(x: 0.7282, y: 0.2481), controlPoint2: CGPoint(x: 0.6904, y: 0.3615))
        return path
    }
    
    static var logo2: UIBezierPath {
        let shape = UIBezierPath()
        shape.move(to: CGPoint(x: 3.66, y: 15))
        shape.addCurve(to: CGPoint(x: 4.29, y: 14.38), controlPoint1: CGPoint(x: 4.02, y: 15), controlPoint2: CGPoint(x: 4.29, y: 14.75))
        shape.addCurve(to: CGPoint(x: 4.26, y: 13.57), controlPoint1: CGPoint(x: 4.29, y: 14.13), controlPoint2: CGPoint(x: 4.26, y: 13.9))
        shape.addCurve(to: CGPoint(x: 7.73, y: 9.93), controlPoint1: CGPoint(x: 4.26, y: 10.98), controlPoint2: CGPoint(x: 5.17, y: 9.93))
        shape.addLine(to: CGPoint(x: 12.55, y: 0))
        shape.addLine(to: CGPoint(x: 14.27, y: 9.82))
        shape.addLine(to: CGPoint(x: 11.91, y: 11.97))
        shape.addLine(to: CGPoint(x: 10.36, y: 13.55))
        shape.addCurve(to: CGPoint(x: 10.19, y: 14), controlPoint1: CGPoint(x: 10.25, y: 13.67), controlPoint2: CGPoint(x: 10.19, y: 13.83))
        shape.addCurve(to: CGPoint(x: 10.81, y: 14.6), controlPoint1: CGPoint(x: 10.19, y: 14.35), controlPoint2: CGPoint(x: 10.46, y: 14.6))
        shape.addCurve(to: CGPoint(x: 11.26, y: 14.41), controlPoint1: CGPoint(x: 10.97, y: 14.6), controlPoint2: CGPoint(x: 11.12, y: 14.54))
        shape.addLine(to: CGPoint(x: 15.9, y: 9.77))
        shape.addCurve(to: CGPoint(x: 16.12, y: 9.3), controlPoint1: CGPoint(x: 16.05, y: 9.63), controlPoint2: CGPoint(x: 16.12, y: 9.47))
        shape.addCurve(to: CGPoint(x: 15.9, y: 8.83), controlPoint1: CGPoint(x: 16.12, y: 9.13), controlPoint2: CGPoint(x: 16.05, y: 8.96))
        shape.addLine(to: CGPoint(x: 11.27, y: 4.21))
        shape.addCurve(to: CGPoint(x: 10.81, y: 4), controlPoint1: CGPoint(x: 11.12, y: 4.06), controlPoint2: CGPoint(x: 10.97, y: 4))
        shape.addCurve(to: CGPoint(x: 10.19, y: 4.6), controlPoint1: CGPoint(x: 10.46, y: 4), controlPoint2: CGPoint(x: 10.19, y: 4.25))
        shape.addCurve(to: CGPoint(x: 10.36, y: 5.04), controlPoint1: CGPoint(x: 10.19, y: 4.77), controlPoint2: CGPoint(x: 10.25, y: 4.93))
        shape.addLine(to: CGPoint(x: 11.91, y: 6.62))
        shape.addLine(to: CGPoint(x: 14.27, y: 8.77))
        shape.addLine(to: CGPoint(x: 12.55, y: 8.68))
        shape.addLine(to: CGPoint(x: 7.67, y: 0))
        shape.addCurve(to: CGPoint(x: 3, y: 13.51), controlPoint1: CGPoint(x: 4.36, y: 8.68), controlPoint2: CGPoint(x: 3, y: 10.13))
        shape.addCurve(to: CGPoint(x: 3.06, y: 14.48), controlPoint1: CGPoint(x: 3, y: 13.92), controlPoint2: CGPoint(x: 3.01, y: 14.27))
        shape.addCurve(to: CGPoint(x: 3.66, y: 15), controlPoint1: CGPoint(x: 3.12, y: 14.76), controlPoint2: CGPoint(x: 3.29, y: 15))
        shape.close()
        
        return shape
    }
    
    static var logo3: UIBezierPath {
        let shape = UIBezierPath()
        shape.move(to: CGPoint(x: 2, y: 5.5))
        shape.addLine(to: CGPoint(x: 4.25, y: 8))
        shape.addLine(to: CGPoint(x: 8.5, y: 1.5))
        shape.close()
        
        return shape
    }
    
    static var logo4: UIBezierPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 3310, y: 5925))
        path.addCurve(to: CGPoint(x: 3185, y: 5880), controlPoint1: CGPoint(x: 3274, y: 5917), controlPoint2: CGPoint(x: 3218, y: 5897))
        path.addLine(to: CGPoint(x: -775452, y: 10958))
        path.addCurve(to: CGPoint(x: -775080, y: 11521), controlPoint1: CGPoint(x: -775211, y: 11049), controlPoint2: CGPoint(x: -775061, y: 11277))
        path.addLine(to: CGPoint(x: -780164, y: 11526))
        path.addCurve(to: CGPoint(x: -779315, y: 12151), controlPoint1: CGPoint(x: -779719, y: 11845), controlPoint2: CGPoint(x: -779346, y: 12120))
        path.close()
        return path
    }
    static var logo5: UIBezierPath {
        let shape = UIBezierPath()
        shape.move(to: CGPoint(x: 3310, y: 5925))
        shape.addCurve(to: CGPoint(x: 3185, y: 5880), controlPoint1: CGPoint(x: -36, y: -8), controlPoint2: CGPoint(x: -92, y: -28))
        shape.addCurve(to: CGPoint(x: 2475, y: 5382), controlPoint1: CGPoint(x: -33, y: -16), controlPoint2: CGPoint(x: -352, y: -240))
        shape.addCurve(to: CGPoint(x: 1025, y: 4341), controlPoint1: CGPoint(x: -357, y: -257), controlPoint2: CGPoint(x: -1010, y: -726))
        shape.addCurve(to: CGPoint(x: 159, y: 3701), controlPoint1: CGPoint(x: -536, y: -384), controlPoint2: CGPoint(x: -822, y: -596))
        shape.addCurve(to: CGPoint(x: 119, y: 2977), controlPoint1: CGPoint(x: -193, y: -194), controlPoint2: CGPoint(x: -210, y: -498))
        shape.addCurve(to: CGPoint(x: 3097, y: 538), controlPoint1: CGPoint(x: 48, y: -65), controlPoint2: CGPoint(x: 2884, y: -2387))
        shape.addCurve(to: CGPoint(x: 3752, y: 631), controlPoint1: CGPoint(x: 216, y: -119), controlPoint2: CGPoint(x: 480, y: -82))
        shape.addCurve(to: CGPoint(x: 3914, y: 1025), controlPoint1: CGPoint(x: 111, y: 111), controlPoint2: CGPoint(x: 164, y: 239))
        shape.addCurve(to: CGPoint(x: 3801, y: 1363), controlPoint1: CGPoint(x: -1, y: 133), controlPoint2: CGPoint(x: -35, y: 235))
        shape.addCurve(to: CGPoint(x: 2987, y: 2048), controlPoint1: CGPoint(x: -22, y: 29), controlPoint2: CGPoint(x: -331, y: 289))
        shape.addLine(to: CGPoint(x: 2209, y: 2685))
        shape.addLine(to: CGPoint(x: 7287, y: 2690))
        shape.addLine(to: CGPoint(x: 12365, y: 2695))
        shape.addLine(to: CGPoint(x: 12424, y: 2717))
        shape.addCurve(to: CGPoint(x: 12796, y: 3280), controlPoint1: CGPoint(x: 241, y: 91), controlPoint2: CGPoint(x: 391, y: 319))
        shape.addCurve(to: CGPoint(x: 12403, y: 3778), controlPoint1: CGPoint(x: -18, y: 233), controlPoint2: CGPoint(x: -162, y: 415))
        shape.addCurve(to: CGPoint(x: 7271, y: 3800), controlPoint1: CGPoint(x: -45, y: 16), controlPoint2: CGPoint(x: -369, y: 17))
        shape.addLine(to: CGPoint(x: 2187, y: 3805))
        shape.addLine(to: CGPoint(x: 2981, y: 4375))
        shape.addCurve(to: CGPoint(x: 3830, y: 5000), controlPoint1: CGPoint(x: 445, y: 319), controlPoint2: CGPoint(x: 818, y: 594))
        shape.addCurve(to: CGPoint(x: 3900, y: 5678), controlPoint1: CGPoint(x: 176, y: 177), controlPoint2: CGPoint(x: 206, y: 470))
        shape.addCurve(to: CGPoint(x: 3594, y: 5915), controlPoint1: CGPoint(x: -74, y: 114), controlPoint2: CGPoint(x: -185, y: 200))
        shape.addCurve(to: CGPoint(x: 3310, y: 5925), controlPoint1: CGPoint(x: -72, y: 23), controlPoint2: CGPoint(x: -207, y: 28))
        
        return shape
    }
    
    static var logo6: UIBezierPath {
        let shape = UIBezierPath()
        shape.move(to: CGPoint(x: 10, y: 10))
        shape.addLine(to: .init(x: 50, y: 50))
        
        return shape
    }
}

struct ScaledBezier: Shape {
    let bezierPath: UIBezierPath

    func path(in rect: CGRect) -> Path {
        let path = Path(bezierPath.cgPath)

        // Figure out how much bigger we need to make our path in order for it to fill the available space without clipping.
//        let multiplier = min(rect.width, rect.height)
        let multiplier = max(rect.width, rect.height)

        // Create an affine transform that uses the multiplier for both dimensions equally.
        let transform = CGAffineTransform(scaleX: 20, y: 20)
        
        // Apply that scale and send back the result.
        return path.applying(transform)
//        return path
    }
}

enum Topping: String, CaseIterable, Identifiable {
    case nuts, cookies, blueberries
    var id: Self { self }
}

struct Screen1: View {
    
    @StateObject var viewModel: Screen1ViewModel = Screen1ViewModel()
    
    var body: some View {
        VStack {
            Text(viewModel.text)
            
            Button("Fetch DB") {
                viewModel.fetchDB()
            }
        }
    }
}

final class Screen1ViewModel: ObservableObject {
    @Published var text: String = "Hello!"
    
    func fetchDB() {
        // for ex.. network request
    }
}

