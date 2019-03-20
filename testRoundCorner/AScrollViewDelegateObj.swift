//
//  AScrollViewDelegateObj.swift
//  testRoundCorner
//
//  Created by aliasyan on 2019/3/19.
//  Copyright © 2019 yellfun. All rights reserved.
//

import UIKit

class AScrollViewDelegateObj: NSObject, UIScrollViewDelegate {
    
    static let sharedInstance = AScrollViewDelegateObj()
    
    weak var bgScrollView:UIScrollView!
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView.contentOffset.x > 100 {
            
            scrollView.isUserInteractionEnabled = false
        }
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        print("hori scrollViewWillEndDragging")
    }
}
