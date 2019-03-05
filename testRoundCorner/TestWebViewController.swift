//
//  TestWebViewController.swift
//  testRoundCorner
//
//  Created by ky on 2019/2/21.
//  Copyright © 2019 yellfun. All rights reserved.
//

import UIKit
import WebKit

class TestWebViewController: UIViewController {
  
  @IBOutlet weak var webview:WKWebView!
  
  override func viewDidLoad() {
    
    super.viewDidLoad()
    
    webview.load(URLRequest(url: URL(string: "https://wx.indoorun.com/gzxiaopeng/?uuid=lkkj10sdkfsdfsdf&unit=15434720156915354")!))
  }
  
  @IBAction func hide() {
    
    self.navigationController?.setNavigationBarHidden(true, animated: true)
  }
}
