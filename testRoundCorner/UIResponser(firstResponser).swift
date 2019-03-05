//
//  UIResponser(firstResponser).swift
//  testRoundCorner
//
//  Created by ky on 2019/2/19.
//  Copyright © 2019 yellfun. All rights reserved.
//

import UIKit

extension UIResponder {
  
  private static weak var _currentFirstResponder: UIResponder?
  
  static var currentFirstResponder: UIResponder? {
    
    _currentFirstResponder = nil
    
    UIApplication.shared.sendAction(#selector(findFirstResponder(_:)), to: nil, from: nil, for: nil)
    
    return _currentFirstResponder
  }
  
  @objc func findFirstResponder(_ sender: Any) {
    
    UIResponder._currentFirstResponder = self
  }
}
