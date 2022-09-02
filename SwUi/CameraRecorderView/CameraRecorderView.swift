//
//  CameraRecorderView.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 02.09.2022.
//

import SwiftUI

struct CameraRecorderView: View {
    
    @StateObject var viewModel: CameraRecorderViewModel = CameraRecorderViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                CameraRecorderPreview(viewModel: viewModel)
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    
                    recordButtonView
                }
                .onAppear(perform: viewModel.viewOnAppear)
            }
        }
    }
    
    private var recordButtonView: some View {
        Button {
            viewModel.startStopRecording()
        } label: {
            ZStack {
                Circle()
                    .stroke(viewModel.isRecording ? .red : .white, lineWidth: 2)
                    .equalFrame(75)
                
                if viewModel.isRecording {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(.red)
                        .equalFrame(45)
                } else {
                    Circle()
                        .fill(.white)
                        .equalFrame(65)
                }
            }
        }
    }
}

#if DEBUG
struct CameraRecorderView_Previews: PreviewProvider {
    static var previews: some View {
        CameraRecorderView()
    }
}
#endif
