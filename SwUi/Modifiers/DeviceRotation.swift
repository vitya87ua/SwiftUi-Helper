//
//  DeviceRotation.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 12.09.2022.
//

import SwiftUI

struct DeviceRotationViewModifier: ViewModifier {
    let action: (UIDeviceOrientation) -> Void
    
    func body(content: Content) -> some View {
        content
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                action(UIDevice.current.orientation)
            }
    }
}

extension View {
    /// Track rotation and call action
    func onRotate(perform action: @escaping (UIDeviceOrientation) -> Void) -> some View {
        self.modifier(DeviceRotationViewModifier(action: action))
    }
}


struct DeviceRotation: View {
    var body: some View {
        Text("Hello, World!")
            .onRotate { deviceOrientation in
                switch deviceOrientation {
                case .unknown:
                    Log("unknown")
                case .portrait:
                    Log("portrait")
                case .portraitUpsideDown:
                    Log("portraitUpsideDown")
                case .landscapeLeft:
                    Log("landscapeLeft")
                case .landscapeRight:
                    Log("landscapeRight")
                case .faceUp:
                    Log("faceUp")
                case .faceDown:
                    Log("faceDown")
                @unknown default:
                    fatalError()
                }
            }
    }
}

#if DEBUG
struct DeviceRotation_Previews: PreviewProvider {
    static var previews: some View {
        DeviceRotation()
    }
}
#endif
