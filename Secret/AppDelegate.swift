//
//  AppDelegate.swift
//  Secret
//
//  Created by Hatsune Okada on 5/16/20.
//  Copyright © 2020 Okada Hattsunn. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let config = Realm.Configuration(
            //新しいバージョンの設定、次に変える時には、前よりも大きい数字にする
            schemaVersion: 0,
            //スキーマのバージョンが上記のものよりも低いものを開くときに自動的に呼び出されるブロックの設定
            migrationBlock: { migration, oldSchemaVersion in oldSchemaVersion == 0
                if (oldSchemaVersion < 1) {
              //Realmは新しいプロパティと削除されたプロパティを自動的に検出、自動的にディスク上のスキーマを更新
                }})
        
        //Realmに新しい方を使うと宣言
        Realm.Configuration.defaultConfiguration = config
        
        //デフォルトのRealmに対してこの新しい設定オブジェクトを使用するようにRealmに指示
        let realm = try! Realm()
        print(realm, "Realm")
        print(config,"Realm Version")
        
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

