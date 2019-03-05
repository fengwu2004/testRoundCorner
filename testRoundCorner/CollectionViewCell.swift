//
//  CollectionViewCell.swift
//  testRoundCorner
//
//  Created by ky on 2019/2/16.
//  Copyright © 2019 yellfun. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
  
  @IBOutlet weak var picture:UIImageView!
  
  @IBOutlet weak var name:UILabel!
  
  static let queue = DispatchQueue(label: "eq")
  
  static let asyncQueue = DispatchQueue(label: "worker_queue", qos: DispatchQoS.userInitiated, attributes: DispatchQueue.Attributes.concurrent, target: queue)
  
  var index:Int = -1
  
  override func awakeFromNib() {
    
    super.awakeFromNib()
  }
  
  func setupImg(_ filePath:String, index:Int) -> Void {
    
    let bound = picture.bounds
    
    let render = UIGraphicsImageRenderer(bounds: bound)
    
    self.index = index
    
    CollectionViewCell.asyncQueue.async {
      
      let img = render.image { (context:UIGraphicsImageRendererContext) in
        
        if index == self.index {
          
          let origimg = UIImage(contentsOfFile: filePath)
          
          origimg?.draw(in: bound)
        }
        else {
          
          print(index, self.index)
        }
      }
      
      DispatchQueue.main.async {
        
        self.picture.image = img
      }
    }
    
    name.text = "\(index)ABCD"
  }
}
