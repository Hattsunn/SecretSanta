//
//  addViewController.swift
//  Secret
//
//  Created by Hatsune Okada on 5/18/20.
//  Copyright © 2020 Okada Hattsunn. All rights reserved.
//

import UIKit
var addpage = [String]()

class addViewController: UIViewController {
    
    @IBOutlet var NameTextField: UITextField!
    @IBOutlet var PriceTextField: UITextField!
    @IBOutlet var MemoTextField: UITextField!
    
    var wordArray: [Dictionary<String, String>] = []
       
    let saveData = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        if saveData.array(forKey: "WORD") != nil {
            wordArray = saveData.array(forKey: "WORD") as! [Dictionary<String, String>]
        }
        // Do any additional setup after loading the view.
    }
    

   @IBAction func saveWord() {
       let wordDictionary = ["Name": NameTextField.text!, "Price": PriceTextField.text!, "Memo": MemoTextField.text!]
       
       wordArray.append(wordDictionary)
       saveData.set(wordArray, forKey: "WORD")
       
       let alert = UIAlertController(title: "保存完了", message: "単語の登録が完了しました", preferredStyle: .alert)
       alert.addAction(UIAlertAction(
           title: "OK", style: .default, handler: nil))
       
       present(alert, animated: true, completion: nil)
       
       NameTextField.text = ""
       PriceTextField.text = ""
       MemoTextField.text = ""
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