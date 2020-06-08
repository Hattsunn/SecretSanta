//
//  addViewController.swift
//  Secret
//
//  Created by Hatsune Okada on 5/18/20.
//  Copyright © 2020 Okada Hattsunn. All rights reserved.
//

import UIKit
import RealmSwift

class addViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet var NameTextField: UITextField!
    @IBOutlet var PriceTextField: UITextField!
    @IBOutlet var MemoTextField: UITextField!
    @IBOutlet var photoImage: UIImageView!
    
    let realm = try! Realm() //レルム宣言
    var image = UIImage()
    
    var alertController: UIAlertController! //アラートを出すための宣言
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    func alert(title:String, message:String) {
        alertController = UIAlertController(title: title,
                                            message: message,
                                            preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK",
                                                style: .default,
                                                handler: nil))
        present(alertController, animated: true)
    }
    
    
    //カメラを起動するボタン
    @IBAction func onTappedCameraButton(){
        presentPickerController(sourceType: .camera)
    }
    
    //アルバムを起動するボタン
    @IBAction func onTappedAlbumButton(){
        presentPickerController(sourceType: .photoLibrary)
    }
    //カメラ、アルバムの呼び出しメゾッド
    func presentPickerController(sourceType: UIImagePickerController.SourceType){
        if UIImagePickerController.isSourceTypeAvailable(sourceType){
            let picker = UIImagePickerController()
            picker.sourceType = sourceType
            picker.delegate = self
            self.present(picker,animated: true, completion: nil)
        }
    }
    
    //写真が選択された時に呼ばれるメゾッド
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        self.dismiss(animated: true, completion: nil)
        //画像の出力
        photoImage.image = info[.originalImage] as? UIImage
        
        //imageに画像を入れる
        image = photoImage.image!
        
    }
    
    
    //文字、写真のデータを保存する
    @IBAction func saveWord() {
        //写真が入っていなかったときのアラート
        if image.pngData() == nil {
            
            alert(title: "No Image", message: "Choose Image")
            
        }else{
            
            let newAdd = Add.create() //新しいデータを作る
            newAdd.name = NameTextField.text!
            newAdd.memo = MemoTextField.text!
            newAdd.price = Int(PriceTextField.text!)!
            newAdd.imageData = (image.pngData())!
            
            newAdd.save()//画面上に登録した文字、写真を保存
            
            //レルム上に追加
            try! realm.write{
                realm.add(newAdd)
            }
            self.dismiss(animated: true, completion: nil) //画面もどる（このままだとトップ画面に戻ってしまう、navigation controllerの場合は別mの書き方）
            
        }
    }
    
    @IBAction func closenametextfield(_ sender: Any) {
    }
    @IBAction func closepricetextfield(_ sender: Any) {
    }
    
    @IBAction func closememotextfield(_ sender: Any) {
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

//UIImage拡張
extension UIImage {
    //イメージをpngに変換する
    func toPNGData() -> Data {
        guard let data = self.pngData() else {
            print("イメージをPNGデータに変換できませんでした")
            return Data()
        }
        return data
    }
}


