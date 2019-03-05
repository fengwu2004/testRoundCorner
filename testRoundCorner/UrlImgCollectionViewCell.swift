//
//  UrlImgCollectionViewCell.swift
//  testRoundCorner
//
//  Created by ky on 2019/2/21.
//  Copyright © 2019 yellfun. All rights reserved.
//

import UIKit

class UrlImgCollectionViewCell: UICollectionViewCell {
  
  @IBOutlet private weak var imgView:UIImageView!
  
  static let queue = DispatchQueue(label: "My_Queue")
  
  override func awakeFromNib() {
    
    super.awakeFromNib()
  }
  
  func processData(_ data:Data?, _ maxDimensionInPixels:CGFloat) -> Void {
    
    if let imgdata = data {
      
      let imageSourceOptions = [kCGImageSourceShouldCache: false] as CFDictionary
      
      let imgsource = CGImageSourceCreateWithData(imgdata as CFData, imageSourceOptions)!
      
      print("X")
      
      let ii = UIImage(data: imgdata)
      
      print("y")
      
      let downsampleOptions =
        [kCGImageSourceCreateThumbnailFromImageAlways: true,
         kCGImageSourceShouldCacheImmediately: true,
         kCGImageSourceCreateThumbnailWithTransform: true,
         kCGImageSourceThumbnailMaxPixelSize: maxDimensionInPixels] as CFDictionary
      
      let downsampledImage = CGImageSourceCreateThumbnailAtIndex(imgsource, 0, downsampleOptions)!
      
      let img = UIImage(cgImage: downsampledImage)
      
      DispatchQueue.main.async {
        
        self.imgView.image = img
        
        print(ii)
      }
    }
  }
  
  func updateImg(_ url:URL, index:Int) -> Void {
    
    let size = imgView.bounds.size
    
    let maxDimensionInPixels = max(size.width, size.height) * UIScreen.main.scale
    
    let task = URLSession.shared.dataTask(with: url) { (data, _, _) in

      print(url)
      
      self.processData(data, maxDimensionInPixels)
    }
    
    task.resume()
  }
}
