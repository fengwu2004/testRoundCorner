//
//  TestProgressBarViewController.swift
//  testRoundCorner
//
//  Created by ky on 2019/2/15.
//  Copyright © 2019 yellfun. All rights reserved.
//

import UIKit

class TestProgressBarViewController: UIViewController {
  
  @IBOutlet weak var progressBar:UIProgressView!
  
  @IBOutlet weak var progressBg:UIView!
  
  @IBOutlet weak var slider:UISlider!
  
  var currentProgress:Float = 0
  
  override func viewDidLoad() {
    
    super.viewDidLoad()
    
    let gesture = UIPanGestureRecognizer(target: self, action: #selector(updateProgressBar(_:)))
    
    progressBg.addGestureRecognizer(gesture)
    
    progressBar.setProgress(0, animated: true)
    
    let render = UIGraphicsImageRenderer(size: CGSize(width: 10, height: 10))
    
    let thumbimg = render.image { (context:UIGraphicsImageRendererContext) in
      
      let path = CGPath(ellipseIn: CGRect(x: 0, y: 0, width: 10, height: 10), transform: nil)
      
      context.cgContext.addPath(path)
      
      UIColor.blue.setFill()
      
      context.cgContext.drawPath(using: CGPathDrawingMode.fill)
    }
    
    let img = UIImage(named: "tex_route")!
    
    img.resizableImage(withCapInsets: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10))
    
    slider.setMinimumTrackImage(img, for: .normal)
    
    slider.setMinimumTrackImage(img, for: .highlighted)
    
    slider.setThumbImage(thumbimg, for: .normal)
    
    slider.setThumbImage(thumbimg, for: .highlighted)
  }
  
  @objc
  func updateProgressBar(_ sender:UIPanGestureRecognizer) -> Void {
    
    let x = sender.location(in: progressBg).x
    
    let width = progressBg.bounds.size.width
    
    let diff = Float(x / width) - progressBar.progress
    
    if abs(diff) < 3 {
      
      progressBar.setProgress(Float(x / width), animated: true)
    }
  }
}
