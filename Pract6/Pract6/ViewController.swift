//
//  ViewController.swift
//  Pract6
//
//  Created by MAD2 on 26/11/18.
//  Copyright © 2018 MAD2. All rights reserved.
//

import UIKit
import QRCode


class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtValue: UITextField!
    @IBOutlet weak var imageViewQR: UIImageView!
    @IBOutlet weak var Button1: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /*let qrcode = QRCode("Hello World!!")
        imageView.image = qrcode!.image*/
     txtValue.resignFirstResponder()
      print(txtValue.text!)
      var qrcode = QRCode(txtValue.text!)
      qrcode?.color = CIColor(rgba: "88000")
      qrcode?.backgroundColor = CIColor(rgba: "ffffff")
      imageViewQR.image = qrcode?.image
     
      
        }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        txtValue.resignFirstResponder()
        print(txtValue.text!)
        var qrcode = QRCode(txtValue.text!)
        qrcode?.color = CIColor(rgba: "88000")
        qrcode?.backgroundColor = CIColor(rgba: "ffffff")
        imageViewQR.image = qrcode?.image
       
        
        return true
    }
    @IBAction func button(_sender:Any)
    {
    txtValue.resignFirstResponder()
    print(txtValue.text!)
    var qrcode = QRCode(txtValue.text!)
    qrcode?.color = CIColor(rgba: "88000")
    qrcode?.backgroundColor = CIColor(rgba: "ffffff")
    imageViewQR.image = qrcode?.image    }
}

