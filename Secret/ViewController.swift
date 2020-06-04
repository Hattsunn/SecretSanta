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
    
    let photos = ["My List1", "My List2", "My List3", "My List4", "My List5", "My List6", "My List7", "My List8", "My List9", "My List10"]

   override func viewDidLoad() {
          super.viewDidLoad()
          // Do any additional setup after loading the view.
          
          //セルのレイアウト調整
          let layout = UICollectionViewFlowLayout()
          layout.sectionInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
          collectionView.collectionViewLayout = layout
    
    }
      
      func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
      }
      
      func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        //セルはストーリーボードで指定したセルのID
        let cell: UICollectionViewCell =
        collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        //タグ番号を使ってImageViewのインスタンスを生成
        let imageView = cell.contentView.viewWithTag(1) as! UIImageView
        
        //画面配列の番号で指定された要素の名前の画像をUIImageとする
        let cellImage = UIImage(named: photos[indexPath.row])
        
        //UIImageをUIImageViewのImageとして設定
        imageView.image = cellImage
        
        //タグ番号を使ってlabelのインスタンスを生成
        let label = cell.contentView.viewWithTag(2) as! UILabel
        label.text = photos[indexPath.row]

          return cell
      }
      
      //セルの大きさや隙間を調整
      func collectionView(_ collectionview: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
          let horizontalSpace : CGFloat = 20
          let cellSize : CGFloat = self.view.bounds.width / 2 - horizontalSpace
          return CGSize(width: cellSize, height: cellSize)
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
