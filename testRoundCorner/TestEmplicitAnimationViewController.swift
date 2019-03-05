//
//  TestEmplicitAnimationViewController.swift
//  testRoundCorner
//
//  Created by ky on 2019/2/16.
//  Copyright © 2019 yellfun. All rights reserved.
//

import UIKit

class TestEmplicitAnimationViewController: UIViewController {
  
  @IBOutlet weak var layerView:UIView!
  
  @IBOutlet weak var btn:UIButton!
  
  var colorLayer:CALayer!
  
  override func viewDidLoad() {
    
    super.viewDidLoad()
    
    addLayer()
    
    let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 20))
    
    label.text = "hello world"
    
    label.backgroundColor = UIColor.white
    
    label.center = CGPoint(x: btn.bounds.size.width/2, y: btn.bounds.size.height/2)
    
    btn.addSubview(label)
    
    btn.alpha = 0.5
  }
  
  func addLayer() -> Void {
    
    colorLayer = CALayer()

    colorLayer.frame = CGRect(x: 0, y: 0, width: 100, height: 100)

    colorLayer.backgroundColor = UIColor.green.cgColor

    self.layerView.layer.addSublayer(colorLayer)

    colorLayer.contents = UIImage(named: "Igloo")?.cgImage
  }

  @IBAction func onAnim() -> Void {
    
    basicAnimation()
  }
  
  func basicAnimation() -> Void {
    
    let basicAnim = CABasicAnimation(keyPath: "backgroundColor")
    
    let tocolor = UIColor(red: 1, green: 0, blue: 0, alpha: 1).cgColor
    
    basicAnim.fromValue = UIColor(red: 0, green: 0, blue: 1, alpha: 1).cgColor
    
    basicAnim.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)

    basicAnim.toValue = tocolor
    
    basicAnim.duration = 5
    
    colorLayer.add(basicAnim, forKey: "keep")
  }
  
  @IBAction func doRemove() -> Void {
    
    colorLayer.removeAnimation(forKey: "keep")
  }
  
  func transition() -> Void {
    
    let transition = CATransition()

    transition.type = .fade

    transition.duration = 5

    self.colorLayer.add(transition, forKey: nil)
    
    CATransaction.begin()
    
    CATransaction.setAnimationDuration(5)
    
    self.colorLayer.contents = UIImage(named: "Spaceship")?.cgImage
    
    CATransaction.commit()
  }
  
  func switchImg() -> Void {
    
    UIView.transition(with: self.layerView, duration: 5, options: [UIView.AnimationOptions.transitionFlipFromTop, .curveEaseInOut], animations: {
      
      self.layerView.layer.contents = UIImage(named: "Spaceship")?.cgImage
      
    }, completion: nil)
  }
  
  func performTransition() -> Void {
    
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, true, 0.0)
    
    self.view.layer.render(in: UIGraphicsGetCurrentContext()!)
    
    let img = UIGraphicsGetImageFromCurrentImageContext()
    
    UIGraphicsEndImageContext()
    
    let coverView = UIImageView(image: img)
    
    coverView.frame  = self.view.bounds
    
    self.view.addSubview(coverView)
    
    UIView.animate(withDuration: 2, animations: {
      
      let trans = CGAffineTransform.identity.scaledBy(x: 0.01, y: 0.01)
      
      coverView.transform = trans
      
      coverView.alpha = 0.0
      
    }) { (_) in
      
      coverView.removeFromSuperview()
      
      self.view.backgroundColor = UIColor.red
    }
  }
}
