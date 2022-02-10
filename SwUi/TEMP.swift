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
}

struct TEMP: View {

    @ObservedObject var viewModel = Model()

    var body: some View {
        ZStack {

            if viewModel.showImage {
                VStack {
//                    Image(uiImage: viewModel.uiImage!)

                    Image("1111", bundle: viewModel.bundle)
                }

            }

            VStack {
                
                HStack {
                    Button("startTim") {
                        viewModel.startTim()
                    }
                    
                    Button("stopTim") {
                        viewModel.stopTim()
                    }
                }
                
                Button("SHOW") {
                    viewModel.showImage.toggle()
                }
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
