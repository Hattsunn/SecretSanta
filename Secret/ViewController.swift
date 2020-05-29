//
//  ViewController.swift
//  Secret
//
//  Created by Hatsune Okada on 5/16/20.
//  Copyright © 2020 Okada Hattsunn. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    @IBOutlet var collectionView: UICollectionView!
    
   override func viewDidLoad() {
          super.viewDidLoad()
          // Do any additional setup after loading the view.
          
          //セルのレイアウト調整
          let layout = UICollectionViewFlowLayout()
          layout.sectionInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
          collectionView.collectionViewLayout = layout
    
    }
      
      func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
          return 10
      }
      
      func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
          let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
          cell.backgroundColor = .cyan
          return cell
      }
      
      //セルの大きさや隙間を調整
      func collectionView(_ collectionview: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
          let horizontalSpace : CGFloat = 20
          let cellSize : CGFloat = self.view.bounds.width / 2 - horizontalSpace
          return CGSize(width: cellSize, height: cellSize)
      }

    //セルが押されたときに呼ばれるメゾッド
    private func collectionView(_ collectionView: UICollectionView, didSelectRowAt indexPath: IndexPath) {
        print("\(collectionViewArray[indexPath.row])が選ばれました！")
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
