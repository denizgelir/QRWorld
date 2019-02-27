//
//  GenerateViewController.swift
//  QRchat
//
//  Created by Deniz Gelir on 2/27/19.
//  Copyright © 2019 Deniz Gelir. All rights reserved.
//

import UIKit

class GenerateViewController: UIViewController,UITextFieldDelegate{

    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBAction func button(_ sender: UIButton) {
        if let myString = myTextField.text {
            let data = myString.data(using: .ascii, allowLossyConversion: false)
            let filter = CIFilter(name: "CIQRCodeGenerator")
            filter?.setValue(data, forKey: "inputMessage")
            //to get qr code in a good quality
            let ciImage = filter?.outputImage
            let transform = CGAffineTransform(scaleX: 10, y: 10)
            let transformImage = ciImage?.transformed(by: transform)
            let image = UIImage(ciImage: transformImage!)
            myImageView.image = image
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        myTextField.delegate = self
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
}
