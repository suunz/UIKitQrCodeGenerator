//
//  ViewController.swift
//  QrCodeGenerator
//
//  Created by Sanjay Tandukar on 8/7/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var proceedButton: UIButton!
    @IBOutlet weak var qrStringText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }

    func setUpUI() {
        qrStringText.placeholder = "Enter text"
        qrStringText.autocorrectionType = .no
        
    }
    
    @IBAction func onProceedButtonPressed(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "QrImageView") as! QrImageViewController
        vc.qrStringData = qrStringText?.text ?? ""
        self.navigationController?.pushViewController(vc, animated: true)
        self.present(vc, animated: true, completion: nil)
    }
}

