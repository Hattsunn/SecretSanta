//
//  add.swift
//  Secret
//
//  Created by Hatsune Okada on 5/30/20.
//  Copyright © 2020 Okada Hattsunn. All rights reserved.
//

import Foundation
import RealmSwift

class Add: Object{
    @objc dynamic var name: String = ""
    @objc dynamic var memo: String = ""
    @objc dynamic var price: Int = 0
}
