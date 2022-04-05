//
//  TEMP.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 01.09.2021.
//

import SwiftUI
import UIKit

final class Model: ObservableObject {
    @Published var textOb: String = "firstText"
    @Published var showImage: Bool = false
    
    var uiImage: UIImage?// = UIImage()
    var bundleName: String = ""
    var bundle: Bundle?
    
    let image: String = """
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN"
    "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">
<svg version="1.1"
     baseProfile="full"
     xmlns="http://www.w3.org/2000/svg"
     xmlns:xlink="http://www.w3.org/1999/xlink"
     xmlns:ev="http://www.w3.org/2001/xml-events"
     width="100%" height="100%">
<rect fill="white" x="0" y="0" width="100%" height="100%" />
<rect fill="red" x="0" y="0" width="90%" height="90%" rx="1em"/>
</svg>
"""
    
    func startTim() {
        var save = FileManager.default.urls(for: .documentDirectory, in: .allDomainsMask)[0]
        var path = save.appendingPathComponent("1111.svg")
        do {
            try image.write(to: path, atomically: false, encoding: .utf8)
        } catch {
            print(#fileID, #function, #line, "")
        }
    }
    
    func stopTim() {
        //        uiImage = loadImageFromDiskWith(fileName: "1111.svg")
        uiImage = loadImageFromDiskWith(fileName: "1111.svg")
        let name = Bundle.main.path(forResource: "123", ofType: "png")
        bundleName = name ?? "zero"
    }
    
    func loadImageFromDiskWith(fileName: String) -> UIImage? {
        
        let documentDirectory = FileManager.SearchPathDirectory.documentDirectory
        
        let userDomainMask = FileManager.SearchPathDomainMask.allDomainsMask
        let paths = NSSearchPathForDirectoriesInDomains(documentDirectory, userDomainMask, true)
        
        if let dirPath = paths.first {
            let imageUrl = URL(fileURLWithPath: dirPath).appendingPathComponent(fileName)
            let imageRet = UIImage(contentsOfFile: imageUrl.path)
            
            //            bundle = Bundle(path: dirPath)
            bundle = Bundle(url: URL(fileURLWithPath: dirPath))
            
            return imageRet
            
        }
        
        return nil
    }
    
    func gogo() async -> String {
        try? await Task.sleep(nanoseconds: 2 * 1_000_000_000)
        return "Bye"
    }
    
    func changeText()  {
        Task {
            textOb =  await gogo()
        }
    }
}
struct TEMP: View {
    
    @ObservedObject var viewModel = Model()
    
    @State var sel: String = "Hello"
    @State var num: Int = 0
    @State var isPresented: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                Circle()
                    .equalFrame(50)
                
                Circle()
                    .equalFrame(100)
                
                Text(viewModel.textOb)
                    .fontWeight(.bold)
                    .background(Color.red)
//                    .brightness(0.5)
//                    .contrast(0.5)
//                    .saturation(0.5)
//                    .grayscale(0.5)
//                    .luminanceToAlpha()
//                    .colorInvert()
                
                Button("GOGO") {
                    viewModel.changeText()
                }
                
                Button("PopOwer") {
                    isPresented.toggle()
                }
                .foregroundColor(.gray)
                .opacity(0.5)
                
                Button("PopOwer") {
                    isPresented.toggle()
                }.disabled(true)
                
                Text("viewModel.textOb").flipsForRightToLeftLayoutDirection(true)
                Text("viewModel.textOb").flipsForRightToLeftLayoutDirection(false)
                
                HStack(alignment: .top) {
                        VStack(alignment: .leading) {
                            Button("Delete 111 messages") {}
                            Button("Delete 222 messages") {}
                        }.textCase(.lowercase)
                    
                        VStack(alignment: .leading) {
                            Button("Delete 1114 messages") {}
                            Button("Delete 2110 messages") {}
                        }
                        .monospacedDigit()
                    }
                    .padding()
                
            }
            
        }
        .task {
            await changeText()
        }
    }
    
    func changeText() async {
        try? await Task.sleep(nanoseconds: 2 * 1_000_000_000)
        sel = "Bye"
    }
}

#if DEBUG
struct TEMP_Previews: PreviewProvider {
    static var previews: some View {
        TEMP()
    }
}
#endif
