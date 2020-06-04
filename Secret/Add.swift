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
    
    static let realm = try! Realm()
    
    @objc dynamic private var id = 0 //プライマリーキーの設定
    
    //realmのなかに何を保存するか
    @objc dynamic var name: String = ""
    @objc dynamic var memo: String = ""
    @objc dynamic var price: Int = 0
    @objc dynamic var imageData = Data()
    
   

    //primarykeyの設定、キーを設定して、特定のものを取り出す
       override static func primaryKey() -> String? {
           return "id"
       }
    
    //新規作成
    static func create() -> Add {
        let add = Add()
        add.id = lastId()
        return add
    }
    
    //Id設定
    static func lastId() -> Int {
        if let add = realm.objects(Add.self).last {
            return add.id + 1
        }else {
            return 1
        }
    }
       
       //保存する
       func save() {
           try! Add.realm.write{
               Add.realm.add(self)
           }
}
}
