//
//  TestURLViewController.swift
//  testRoundCorner
//
//  Created by ky on 2019/2/21.
//  Copyright © 2019 yellfun. All rights reserved.
//

import UIKit

class TestURLViewController: UIViewController, UICollectionViewDataSource {
  
  static let cellResue = "urlCollectCell"
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
    return 300
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TestURLViewController.cellResue, for: indexPath) as! UrlImgCollectionViewCell
    
    let row = indexPath.row
    
    let url = URL(string: "http://192.168.0.219:80/hdimg//\(row).jpg")!
    
    cell.updateImg(url, index: row)
    
    return cell
  }
  
  @IBOutlet private weak var collectView:UICollectionView!
  
  override func viewDidLoad() {
    
    super.viewDidLoad()
    
    collectView.dataSource = self
    
    collectView.register(UINib(nibName: "UrlImgCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: TestURLViewController.cellResue)
  }
}
