//
//  CameraRecorderPreview.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 02.09.2022.
//

import AVFoundation
import SwiftUI

struct CameraRecorderPreview: UIViewRepresentable {
    
    @ObservedObject var viewModel: CameraRecorderViewModel
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: UIScreen.main.bounds)
        
        viewModel.previewLayer = AVCaptureVideoPreviewLayer(session: viewModel.session)
        
        if let previewLayer = viewModel.previewLayer {
            previewLayer.frame = view.frame
            previewLayer.videoGravity = .resizeAspectFill
            
            view.layer.addSublayer(previewLayer)
        }
        
        viewModel.session.startRunning()
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) { }
}

