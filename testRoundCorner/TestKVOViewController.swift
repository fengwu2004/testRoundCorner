//
//  TestKVOViewController.swift
//  testRoundCorner
//
//  Created by ky on 2019/2/19.
//  Copyright © 2019 yellfun. All rights reserved.
//

import UIKit

class TestKVOViewController: UIViewController {
  
  @IBOutlet weak var btn:UIButton!
  
  let obj = TestObj()
  
  let zobj = ZObject()
  
  override func viewDidLoad() {
    
    super.viewDidLoad()
    
    obj.addObserver(self, forKeyPath: "kvoproperty", options: [.new, .old], context: nil)
    
    btn.addTarget(self, action: #selector(doClick(_:)), for: UIControl.Event.touchUpInside)
    
    let _ = ZObject()
  }
  
  @objc func doClick(_ sender:UIButton) -> Void {
    
    let firstResponser = UIResponder.currentFirstResponder
    
    print("click")
  }
  
  override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
    
    if keyPath == "kvoproperty" {
      
      print(change)
      
      return
    }
    
    super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
  }
  
  override func viewDidAppear(_ animated: Bool) {
    
    super.viewDidAppear(animated)
    
    setup()
  }
  
  func setup() -> Void {
    
    obj.doChange()
  }
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    
    print("nibName")
  }
  
  required init?(coder aDecoder: NSCoder) {
    
    super.init(coder: aDecoder)
    
    print("init")
  }
  
  override func awakeFromNib() {
    
    super.awakeFromNib()
    
    print("awakeFromNib")
  }
  
  override func loadView() {
    
    super.loadView()
    
    print("loadView")
  }
  
  deinit {
    
    
  }
}
