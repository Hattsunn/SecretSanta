//
//  NextViewController.swift
//  Secret
//
//  Created by Hatsune Okada on 6/11/20.
//  Copyright © 2020 Okada Hattsunn. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {
    
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var PriceLabel: UILabel!
    @IBOutlet weak var MemoLabel: UILabel!
    @IBOutlet weak var photoImage: UIImageView!
   
    
    var addsNextView: Add!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //それぞれのラベル、イメージに値をいれる
        
        NameLabel.text = addsNextView.name
        PriceLabel.text = String(addsNextView.price)
        MemoLabel.text = addsNextView.memo
        photoImage.image = UIImage(data: addsNextView.imageData)
        
        // Do any additional setup after loading the view.
        
       
    }
    
    //SNSでシェアできるように
    @IBAction func onTappedUploadButton() {
        if photoImage.image != nil {
            //共有アイテムを設定
            let activeVC = UIActivityViewController(activityItems: [photoImage.image!, NameLabel.text!], applicationActivities: nil)
            self.present(activeVC, animated: true, completion: nil)
        }else{
            print("no image")
        }
    }
    //前の画面に戻る、Navigation Controllerと繋いでいる時は、dismissではなく、popToRootViewControllerをつかう
    @IBAction func  BackButton(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
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
