//
//  ViewControllerCollectionViewCell.swift
//  Secret
//
//  Created by Hatsune Okada on 6/5/20.
//  Copyright © 2020 Okada Hattsunn. All rights reserved.
//

import UIKit

class ViewControllerCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var photos: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        //セルの枠の太さ
        self.layer.borderWidth = 1.0
        
        //セルの枠の色
        self.layer.borderColor = UIColor.darkGray.cgColor
        
        //セルを丸く
        self.layer.cornerRadius = 8.0
    }
}
