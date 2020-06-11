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

        photoImage.image = UIImage(named: addsNextView.imageData)
        NameLabel.text = addsNextView.name
        PriceLabel.text = Sring(addsNextView.price)
        MemoLabel.text = addsNextView.memo
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func BackButton() {
        dismiss(animated: true, completion: nil)
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
