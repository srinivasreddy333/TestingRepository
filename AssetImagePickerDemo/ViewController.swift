//
//  ViewController.swift
//  AssetImagePickerDemo
//
//  Created by Vivek Dharmani on 20/07/20.
//  Copyright © 2020 Vivek Dharmani. All rights reserved.
//

import UIKit
import ImagePicker
import Photos


class ViewController: UIViewController,ImagePickerDelegate {
   
     let imagePickerController = ImagePickerController()
    
    var selectedAssets = [PHAsset]()
    
    var imgArray = [UIImage]()
   
  public var imageAssets: [UIImage] {
     let images = imageAssets
    return AssetManager.resolveAssets(imagePickerController.stack.assets)
  }
    var configuration = Configuration()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
      //  configuration.doneButtonTitle = "Finish"
        configuration.noImagesTitle = "Sorry! There are no images here!"
        configuration.recordLocation = false

        let imagePicker = ImagePickerController(configuration: configuration)
    }


    @IBAction func BtnAction(_ sender: Any) {
      let imagePickerController = ImagePickerController()
        imagePickerController.imageLimit = 5
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    func wrapperDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
           print("123")
       }
       
       func doneButtonDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
           configuration.doneButtonTitle = "Finish"
      //  configuration.doneButtonTitle = "Finish"
        configuration.noImagesTitle = "Sorry! There are no images here!"
        configuration.recordLocation = false
       }
       
       func cancelButtonDidPress(_ imagePicker: ImagePickerController) {
            print("123")
       }
}


extension PHAsset {
    var image : UIImage {
        var thumbnail = UIImage()
        let imageManager = PHCachingImageManager()
        imageManager.requestImage(for: self, targetSize: CGSize(width: 100, height: 100), contentMode: .aspectFit, options: nil, resultHandler: { image, _ in
            thumbnail = image!
        })
        return thumbnail
    }
}
