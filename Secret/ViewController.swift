//
//  ViewController.swift
//  Secret
//
//  Created by Hatsune Okada on 5/16/20.
//  Copyright © 2020 Okada Hattsunn. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    //写真表示用
    @IBOutlet var photoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //カメラボタンを押した時に呼ばれるメソッド
   @IBAction func onTappedCameraButton(){
              presentPickerController(sourceType: .camera)
          }
    
    //アルバムボタンを押した時に呼ばれるメソッド
    @IBAction func onTappedAlubumButton(){
        presentPickerController(sourceType: .photoLibrary)
    }
    
    //カメラ、アルバムの呼び出しメソッド（カメラ・アルバムのソースが引数）
    func presentPickerController(sourceType: UIImagePickerController.SourceType) {
        if UIImagePickerController.isSourceTypeAvailable(sourceType) {
            let picker = UIImagePickerController()
            picker.sourceType = sourceType
            picker.delegate = self
            self.present(picker,animated:true,completion:nil)
        }
    }
    
    //写真が選択された時に呼ばれるメソッド
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        self.dismiss(animated: true,completion: nil)
        //画像を出力
        photoImageView.image = info[.originalImage]as? UIImage
    }
    
}
