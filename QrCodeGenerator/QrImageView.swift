//
//  QrImageView.swift
//  QrCodeGenerator
//
//  Created by Sanjay Tandukar on 8/7/23.
//

import Foundation
import UIKit

class QrImageViewController: UIViewController {
    var qrStringData: String = ""
   
    @IBOutlet weak var qrImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        generateQrImage()
    }

    
    func setUpUI() {
     
    }
    
    func generateQrImage() {
            let data = qrStringData.data(using: String.Encoding.utf8)
            
            // Create QR code filter
            guard let qrFilter = CIFilter(name: "CIQRCodeGenerator") else {
                return
            }
            
            // Set the message string as input
            qrFilter.setValue(data, forKey: "inputMessage")
            
            // Get the output image from the filter
            guard let outputImage = qrFilter.outputImage else {
                return
            }
            
            // Scale the image for better visibility
            let scaleX = UIScreen.main.scale
            let transform = CGAffineTransform(scaleX: scaleX, y: scaleX)
            let scaledImage = outputImage.transformed(by: transform)
            
            // Convert CIImage to UIImage
            let context = CIContext(options: nil)
            guard let cgImage = context.createCGImage(scaledImage, from: scaledImage.extent) else {
                return
            }
            
            let qrCodeImage = UIImage(cgImage: cgImage)
            qrImageView.image = qrCodeImage
            return
        }

}
