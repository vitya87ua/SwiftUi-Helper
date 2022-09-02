//
//  CameraRecorderViewModel.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 02.09.2022.
//

import AVFoundation

final class CameraRecorderViewModel: NSObject, ObservableObject {
    @Published var isRecording: Bool = false {
        didSet {
            Log("Recording \(isRecording ? "started" : "stopped")")
        }
    }
        
    var session: AVCaptureSession = AVCaptureSession()
    var output: AVCaptureMovieFileOutput = AVCaptureMovieFileOutput()
    var previewLayer: AVCaptureVideoPreviewLayer?
    var videoUrl: URL?
    
    func viewOnAppear() {
        checkAuthorizationStatus()
    }
    
    func startStopRecording() {
        if isRecording {
            stopRecording()
        } else {
            startRecording()
        }
    }
    
    private func checkAuthorizationStatus() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
            
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { [self] isSuccess in
                if isSuccess {
                    setupCaptureSession()
                }
            }
        case .restricted:
            break
        case .denied:
            break
        case .authorized:
            setupCaptureSession()
        @unknown default:
            break
        }
    }
    
    private func setupCaptureSession() {
        do {
            session.beginConfiguration()
            
            let device = AVCaptureDevice.default(
                .builtInDualWideCamera,
                for: .video,
                position: .back
            )
            
            let sessionPreset: AVCaptureSession.Preset = .high
            
            if let device = device {
                let input = try AVCaptureDeviceInput(device: device)
                
                if session.canAddInput(input) {
                    session.addInput(input)
                }
                
                if session.canAddOutput(output) {
                    session.addOutput(output)
                }
                
                if session.canSetSessionPreset(sessionPreset) {
                    session.sessionPreset = sessionPreset
                }
                
                session.commitConfiguration()
            } else {
                Log("Error: AVCaptureDevice == nil", device as Any, state: .error)
            }
        } catch {
            Log(error)
        }
    }
    
    private func startRecording() {
        let fileName: String = "\(Date()).mov"
        let tempPath = NSTemporaryDirectory() + fileName
        let outputUrl = URL(fileURLWithPath: tempPath)
        
        output.startRecording(to: outputUrl, recordingDelegate: self)
        isRecording = true
    }
    
    private func stopRecording() {
        output.stopRecording()
        isRecording = false
    }
}

extension CameraRecorderViewModel: AVCaptureFileOutputRecordingDelegate {
    func fileOutput(
        _ output: AVCaptureFileOutput,
        didFinishRecordingTo outputFileURL: URL,
        from connections: [AVCaptureConnection],
        error: Error?
    ) {
        if let error = error {
            Log(error)
        } else {
            videoUrl = outputFileURL
            Log(outputFileURL)
        }
    }
}

