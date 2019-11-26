//
//  QRCodeReaderViewController.swift
//  Pract6
//
//  Created by MAD2 on 28/11/18.
//  Copyright © 2018 MAD2. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation
import QRCodeReader

class TabViewController : UIViewController, QRCodeReaderViewControllerDelegate {
    
    
    lazy var readerVC: QRCodeReaderViewController = {
        let builder = QRCodeReaderViewControllerBuilder {
            $0.reader = QRCodeReader(metadataObjectTypes: [.qr], captureDevicePosition: .back)
        }
        return QRCodeReaderViewController(builder: builder)
    }()

    func reader(_ reader: QRCodeReaderViewController, didScanResult result: QRCodeReaderResult) {
        reader.stopScanning()
        dismiss(animated: true, completion: nil)
    }

    func Alert(value: String) {
        let alert = UIAlertController(title: "QR code capture!", message: value, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Got it!", style: .default, handler: nil))
    }

    func readerDidCancel(_ reader: QRCodeReaderViewController) {
        reader.stopScanning()
        dismiss(animated: true, completion: nil)
    }

    func reader(_ reader: QRCodeReaderViewController, didSwitchCamera newCaptureDevice: AVCaptureDeviceInput) {
        let cameraName = newCaptureDevice.device.localizedName
            print("Switching capturing to: \(cameraName)")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var lblValue: UILabel!
    
    @IBAction func btnCamera(_ sender: Any) {
        s = ""
        readerVC.delegate = self
        readerVC.modalPresentationStyle = .formSheet
        readerVC.completionBlock = {(result: QRCodeReaderResult?) in
            if result != nil{
                print(result!.value)
            }
        }
        
        present(readerVC, animated: true, completion: nil)
    }
    var s:String = ""
}
