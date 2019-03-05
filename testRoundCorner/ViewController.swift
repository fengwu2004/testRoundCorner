//
//  ViewController.swift
//  testRoundCorner
//
//  Created by ky on 2019/2/14.
//  Copyright © 2019 yellfun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var roundView:UIView!
  
  var cornerLayers = [CALayer(), CALayer(), CALayer(), CALayer()]
  
  override func viewDidLoad() {
    
    super.viewDidLoad()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    
    super.viewDidAppear(animated)
    
    setupImageRender(roundView.bounds)
  }
  
  func setupImageRender(_ rect:CGRect) -> Void {
    
    let render = UIGraphicsImageRenderer(size: rect.size)
    
    let img = render.image { (context:UIGraphicsImageRendererContext) in
      
      let img = UIImage(named: "1")
      
      let path = CGPath(roundedRect: rect.insetBy(dx: 10, dy: 10), cornerWidth: 40, cornerHeight: 40, transform: nil)
      
      context.cgContext.addPath(path)
      
      UIColor.blue.setStroke()
      
      context.cgContext.setLineWidth(5)
      
      img?.draw(in: rect)
      
      context.cgContext.drawPath(using: CGPathDrawingMode.stroke)
    }
    
    roundView.layer.contents = img.cgImage
  }
  
  func setup(_ rect:CGRect) -> Void {
    
    let radius:CGFloat = 10.0 * UIScreen.main.scale
    
    let size = CGSize(width: radius + 1, height: radius + 1)
    
    UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
    
    let roundedRect = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: radius * 2, height: radius * 2), cornerRadius: radius)
    
    roundedRect.usesEvenOddFillRule = true
    
    roundedRect.append(UIBezierPath(rect: CGRect(x: -1, y: -1, width: radius * 2 + 1, height: radius * 2 + 1)))
    
    UIColor.red.setFill()
    
    roundedRect.fill()
    
    let img = UIGraphicsGetImageFromCurrentImageContext()
    
    UIGraphicsEndImageContext()
    
    let layer = CALayer()
    
    layer.contents = img?.cgImage
    
    layer.bounds = CGRect(x: 0, y: 0, width: size.width, height: size.height)
    
    layer.anchorPoint = CGPoint(x: 0, y: 0)
    
    roundView.layer.addSublayer(layer)
  }
}

