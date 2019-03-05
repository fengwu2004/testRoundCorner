//
//  TestCollectionViewViewController.swift
//  testRoundCorner
//
//  Created by ky on 2019/2/16.
//  Copyright © 2019 yellfun. All rights reserved.
//

import UIKit

class TestCollectionViewViewController: UIViewController, UICollectionViewDataSource {
  
  @IBOutlet weak var collectionView:UICollectionView!
  
  let CellId = "picturecell"
  
  var imgUrls = [String]()
  
  override func viewDidLoad() {
    
    super.viewDidLoad()
    
    collectionView.dataSource = self
    
    let path = Bundle.main.resourcePath!
    
    for i in 0..<300 {
      
      imgUrls.append("\(path)//hdimg//\(i).jpg")
    }
    
    collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: CellId)
  }
  
  override func viewDidLayoutSubviews() {
    
    super.viewDidLayoutSubviews()
    
    let collectionViewLayout = collectionView.collectionViewLayout
    
    print(collectionViewLayout)
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
    return imgUrls.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellId, for: indexPath) as! CollectionViewCell
    
    let index = indexPath.row
    
    cell.setupImg(imgUrls[index], index: index)
    
    return cell
  }
}
