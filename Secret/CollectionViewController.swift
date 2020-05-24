//
//  CollectionViewController.swift
//  Secret
//
//  Created by Hatsune Okada on 5/24/20.
//  Copyright © 2020 Okada Hattsunn. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController {

    private let photos = ["photo0", "photo1", "photo2", "photo3", "photo4", "photo5","photo0", "photo1", "photo2", "photo3", "photo4", "photo5"]
    private let userImages = ["userImage0", "userImage1", "userImage2", "userImage3", "userImage4", "userImage5","userImage0", "userImage1", "userImage2", "userImage3", "userImage4", "userImage5"]
    private let titles = ["パンケーキ", "ラーメン", "サンドウィッチ", "人参とポテト", "プレートランチ", "サーモングリル", "パンケーキ", "ラーメン", "サンドウィッチ", "人参とポテト", "プレートランチ", "サーモングリル"]
    
    //レイアウト設定
    private let sectionInsets = UIEdgeInsets(top: 10.0, left: 2.0, bottom: 2.0, right: 2.0)
    
    //一行あたりのアイテム数
    private let itemsPerRow: CGFloat = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }
    
    //１つのセクションの中に表示するセルの数
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    //セルに表示する内容
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    // "cell" の部分はstoryboardでつけたcellのidentifier
        let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        //tag番号を使ってインスタンスを作る
        let photoImageView = cell.contentView.viewWithTag(1) as! UIImageView
        let photoImage = UIImage(named: photos[indexPath.row])
        photoImageView.image = photoImage
        let userImageView = cell.contentView.viewWithTag(2) as! UIImageView
                   let userImage = UIImage(named: userImages[indexPath.row])
                   userImageView.image = userImage
                   
                   let titleLabel = cell.contentView.viewWithTag(3) as! UILabel
                   titleLabel.text = titles[indexPath.row]
                   
        return cell
    }
    
    //スクリーンサイズに応じたセルサイズを返す
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        return CGSize(width: widthPerItem, height: widthPerItem + 42)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    // セルの行間の設定
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
