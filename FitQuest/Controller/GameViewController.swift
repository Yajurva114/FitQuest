//
//  GameViewController.swift
//  FitQuest
//
//  Created by yajurva shrotriya on 3/5/23.
//

import UIKit
import AVFoundation
import AudioToolbox

class GameViewController: UIViewController {
    
    let videoCapture = VideoCapture()
    
    var previewLayer: AVCaptureVideoPreviewLayer?
    var pointsLayer = CAShapeLayer()
    let label = UILabel()
    
    var isJumpDetected = false
//    var isLungeDetected = false
//    var otherDetected = false
//
//    var lungePoints = 0
    var jumpPoints = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        //self.view.addSubview(label)
        
        setupVideoPreview()
        
        videoCapture.predictor.delegate = self
    }
    
    private func setupVideoPreview() {
        videoCapture.startCaptureSession()
        previewLayer = AVCaptureVideoPreviewLayer(session: videoCapture.captureSession)
        
        guard let previewLayer = previewLayer else { return }
        
        view.layer.addSublayer(previewLayer)
        previewLayer.frame = view.frame
        
        view.layer.addSublayer(pointsLayer)
        pointsLayer.frame = view.frame
        pointsLayer.strokeColor = UIColor.white.cgColor
       
        label.font = UIFont(name: "Helvetica-Bold", size: 30)
        label.frame = CGRect(x: 100 + 20, y: 100 + 20, width: 150, height: 100)
        label.textColor = UIColor.yellow
        label.isHidden = false
        
        
        label.center = CGPoint(x: 50, y: 140)
        label.textAlignment = .center
        label.text = "0"
        view.layer.addSublayer(label.layer)
        
    }
}

extension GameViewController: PredictorDelegate {
    
    func predictor(_ predictor: Predictor, didLabelAction action: String, with confidence: Double) {

        if action == "Jump" && confidence > 0.95 && isJumpDetected == false {
            isJumpDetected = true
            self.jumpPoints = self.jumpPoints + 1.0
            print("Jump Points =", self.jumpPoints)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.isJumpDetected = false
                self.label.text = "FitPoints: \(self.jumpPoints)"
            }
            
            DispatchQueue.main.async {
                AudioServicesPlayAlertSound(SystemSoundID(1322))
            }
        }
//        else if action == "Standing" && confidence > 0.95 && isLungeDetected == false {
//            isLungeDetected = true
//            self.lungePoints = self.lungePoints + 1
//            print("Standing Points =", self.lungePoints)
//
//            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//                self.isLungeDetected = false
//            }
//
//            DispatchQueue.main.async {
//                AudioServicesPlayAlertSound(SystemSoundID(1322))
//            }
//        }
        else if action == "Others" && confidence > 0.95{
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                //Others
            }
        }
    }
    
    func predictor(_ predictor: Predictor, didFindNewRecognizedPoints points: [CGPoint]) {
        guard let previewLayer = previewLayer else { return }
        
        let convertedPoints = points.map {
            previewLayer.layerPointConverted(fromCaptureDevicePoint: $0)
        }
        
        let combinedPath = CGMutablePath()
        
        for point in convertedPoints {
            let dotPath = UIBezierPath(ovalIn: CGRect(x: point.x, y: point.y, width: 10, height: 10))
            combinedPath.addPath(dotPath.cgPath)
        }
        
        pointsLayer.path = combinedPath
        
        DispatchQueue.main.async {
            self.pointsLayer.didChangeValue(for: \.path)
        }
        
       
    }
}
    
//    func setUpCamera() {
//            videoCapture = VideoCapture()
//            //videoCapture.delegate = self
//            //videoCapture.fps = 30
//            videoCapture.setUp(sessionPreset: .high) { success in
//
//                if success {
//
//                    if let previewLayer = self.videoCapture.previewLayer {
//                        self.view.layer.addSublayer(previewLayer)
//                        self.resizePreviewLayer()
//                    }
//
//                    self.videoCapture.start()
//                }
//            }
//        }
//
//    func resizePreviewLayer() {
//            videoCapture.previewLayer?.frame = view.frame
//        }
//}
