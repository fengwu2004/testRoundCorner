//
//  TestObj.swift
//  testRoundCorner
//
//  Created by ky on 2019/2/19.
//  Copyright © 2019 yellfun. All rights reserved.
//

import UIKit

class TestObj: NSObject {
  
  @objc dynamic private var kvoproperty:NSInteger = 0
  
  func doChange() -> Void {
    
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + DispatchTimeInterval.seconds(5)) {
      
      self.kvoproperty = 10
    }
  }
}
