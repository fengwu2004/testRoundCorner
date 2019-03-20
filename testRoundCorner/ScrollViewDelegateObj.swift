//
//  ScrollViewDelegateObj.swift
//  testRoundCorner
//
//  Created by aliasyan on 2019/3/19.
//  Copyright © 2019 yellfun. All rights reserved.
//

import UIKit

class ScrollViewDelegateObj: NSObject, UIScrollViewDelegate {
    
    static let sharedIntance = ScrollViewDelegateObj()
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        print("bgScrollView")
    }
}
