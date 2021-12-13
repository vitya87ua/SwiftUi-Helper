//
//  CalPixelsAndPointsView.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 13.12.2021.
//

import SwiftUI

struct CalPixelsAndPointsView: View {
    
    let screen = UIScreen.main.bounds
    
    @State var location1: CGFloat = 100
    @State var location2: CGFloat = 500

    @State var coe: CGFloat = 0
    
    let realHeight: CGFloat = 1702.0
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("\(location1)")
                    Text("\(location2)")
                }
                
                HStack {
                    Text("Po \(getSize())")
                    Text("Px \(getSize() * coe)")
                }
                .padding(.bottom, 0)
                
                GeometryReader { geoSize in
                    ZStack {
                        Image("123")
                            .resizable()
                            .scaledToFit()
                            .border(Color.red, width: 1)
                        
                        Slider()
                            .position(x: screen.width / 2, y: location1)
                            .gesture(
                                simpleDrag11(size: geoSize.size)
                            )
                        
                        Slider()
                            .position(x: screen.width / 2, y: location2)
                            .gesture(
                                simpleDrag22(size: geoSize.size)
                            )
                    }
                }
            }
        }
    }
    
    func simpleDrag11(size: CGSize) -> some Gesture {
        getCoe(size: size)
        
       return DragGesture()
            .onChanged { value in
                if value.location.y < 0 {
                    self.location1 = 0
                } else if value.location.y > size.height {
                    self.location1 = size.height
                } else {
                    self.location1 = value.location.y
                }
            }
    }
    
    func simpleDrag22(size: CGSize) -> some Gesture {
        getCoe(size: size)
        
       return DragGesture()
            .onChanged { value in
                if value.location.y < 0 {
                    self.location2 = 0
                } else if value.location.y > size.height {
                    self.location2 = size.height
                } else {
                    self.location2 = value.location.y
                }
            }
    }
    
    func getSize() -> CGFloat {
        location1 > location2 ? location1 - location2 : location2 - location1
    }
    
    func getCoe(size: CGSize) {
       coe = realHeight / size.height
    }
}

struct Slider: View {
    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: 1)
            
            HStack {
                Spacer()
                ZStack {
                    Color.blue
                    Image(systemName: "arrowtriangle.left.fill.and.line.vertical.and.arrowtriangle.right.fill")
                        .foregroundColor(.white)
                        .rotationEffect(Angle(degrees: 90))
                }
                .frame(width: 35, height: 35)
                .clipShape(Capsule())
                    .padding(.trailing)
            }
        }
        .foregroundColor(.blue)
    }
}

#if DEBUG
struct CalPixelsAndPointsView_Previews: PreviewProvider {
    static var previews: some View {
        CalPixelsAndPointsView()
    }
}
#endif
