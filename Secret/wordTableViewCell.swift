//
//  WordTableViewCell.swift
//  Secret
//
//  Created by Hatsune Okada on 5/19/20.
//  Copyright © 2020 Okada Hattsunn. All rights reserved.
//

import UIKit

class WordTableViewCell: UITableViewCell {

    @IBOutlet var NameLabel: UILabel!
    @IBOutlet var PriceLabel: UILabel!
    @IBOutlet var MemoLabel: UILabel!
    @IBOutlet var photoImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
