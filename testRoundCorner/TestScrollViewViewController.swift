//
//  TestScrollViewViewController.swift
//  testRoundCorner
//
//  Created by ky on 2019/3/4.
//  Copyright © 2019 yellfun. All rights reserved.
//

import UIKit

class TestScrollViewViewController: UIViewController {
  
  @IBOutlet weak var scrollView:UIScrollView!
  
  var colorView:UIView!
  
  override func viewDidLoad() {
    
    super.viewDidLoad()
    
    colorView = UIView()
    
    colorView.backgroundColor = UIColor.red
    
    colorView.translatesAutoresizingMaskIntoConstraints = false
    
    let safelayout = self.view.safeAreaLayoutGuide
    
    self.view.addSubview(colorView)
    
    NSLayoutConstraint.activate([
      colorView.leadingAnchor.constraint(equalTo: safelayout.leadingAnchor),
      colorView.topAnchor.constraint(equalTo: safelayout.topAnchor),
      colorView.widthAnchor.constraint(equalToConstant: 100),
      colorView.heightAnchor.constraint(equalToConstant: 44)])
    
//    self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-100-[colorView(44)]", options: [], metrics: nil, views: ["colorView":colorView]))
//
//    self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-100-[colorView(200)]", options: [], metrics: nil, views: ["colorView":colorView]))
  }
  
  @IBAction func doChange() {
    
    self.navigationController?.setNavigationBarHidden(true, animated: true)
  }
  
  override func viewDidAppear(_ animated: Bool) {
    
    super.viewDidAppear(animated)
  }
}
