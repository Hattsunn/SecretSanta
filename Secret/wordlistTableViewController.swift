//
//  wordlistTableViewController.swift
//  Secret
//
//  Created by Hatsune Okada on 5/19/20.
//  Copyright © 2020 Okada Hattsunn. All rights reserved.
//

import UIKit
import RealmSwift

class wordlistTableViewController: UITableViewController {

    let realm = try! Realm()
    var add = try!Realm().objects(Add.self).sorted(byKeyPath: "name")
    var notificationToken: NotificationToken?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 160
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
    }
        

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
//テーブルビュー上のセルの数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return add.count
    }
    
//テーブルビューセルにrealm内のデータを表示させる
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! WordTableViewCell
       
         var adds = Add.loadAll() //addsをrealmに保存されている全データを並べたものにする
        
       cell.NameLabel.text = add[indexPath.row].name
       cell.MemoLabel.text = add[indexPath.row].memo
       cell.PriceLabel.text = String(add[indexPath.row].price)
       cell.photoImage.image = UIImage(data: add[indexPath.row].imageData)
    //実際のセル上に表示
    
        print(Add.loadAll())
       return cell
   }
    
    //セルの消去
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            do{
                let realm = try! Realm()
                try! realm.write{
                    realm.delete(add[indexPath.row])
                }
               
                
                tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
            }
    }
}

    var addsword: Add! //NextViewControllerに値を渡す
    //詳細画面への遷移
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueidentifier" {
    
            let nextView = segue.destination as? NextViewController
            
            nextView?.addsNextView = addsword
        }
    }
    
   
    
    
    
    @IBAction func BackButton() {
        dismiss(animated: true, completion: nil)
    }
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
 
extension Data {
     //データをイメージに変換
     func toImage() -> UIImage {
         let image = UIImage()
         let pngData = image.toPNGData()
         let pngImage = pngData.toImage()
        
        guard UIImage(data: self) != nil else {
             print("データをイメージに変換できませんでした")
             return UIImage()
         }
         return image
     }
 }

