//
//  TestScrollHitTestViewController.swift
//  testRoundCorner
//
//  Created by aliasyan on 2019/3/19.
//  Copyright © 2019 yellfun. All rights reserved.
//

import UIKit

class TestScrollHitTestViewController: UIViewController, UIScrollViewDelegate {
    
    var bgScrollView:UIScrollView!
    
    var view1:UIScrollView!
    
    var view2:UILabel!
    
    var view3:UILabel!
    
    var verticalScrollView:UIScrollView!
    
    func createFirstScrollView() -> Void {
    
        verticalScrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        
        verticalScrollView.contentSize = CGSize(width: 300, height: 300)
        
        verticalScrollView.delegate = self
        
        print(verticalScrollView.panGestureRecognizer)
        
        view1 = UIScrollView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        
        view1.delegate = AScrollViewDelegateObj.sharedInstance
        
        AScrollViewDelegateObj.sharedInstance.bgScrollView = bgScrollView
        
        view1.showsVerticalScrollIndicator = false
        
        view1.showsHorizontalScrollIndicator = false
        
        view1.backgroundColor = UIColor.red
        
        view1.contentSize = CGSize(width: 400, height: 300)
        
        let subview = UILabel(frame: CGRect(x: 0, y: 0, width: 400, height: 300))

        subview.text = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

        subview.backgroundColor = UIColor.gray
        
        view1.addSubview(subview)

        verticalScrollView.addSubview(view1)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        bgScrollView = UIScrollView(frame: CGRect(x: 50, y: 100, width: 300, height: 300))
        
        bgScrollView.showsVerticalScrollIndicator = false
        
        bgScrollView.showsHorizontalScrollIndicator = false
        
        self.createFirstScrollView()

        bgScrollView.addSubview(verticalScrollView)
        
        view2 = UILabel(frame: CGRect(x: 300, y: 0, width: 300, height: 300))
        
        view2.backgroundColor = UIColor.green
        
        view2.textAlignment = .center
        
        view2.text = "2"
        
        bgScrollView.addSubview(view2)
        
        view3 = UILabel(frame: CGRect(x: 600, y: 0, width: 300, height: 300))
        
        view3.backgroundColor = UIColor.blue
        
        view3.text = "3"
        
        view3.textAlignment = .center
        
        bgScrollView.addSubview(view3)
        
        view.addSubview(bgScrollView)
        
        bgScrollView.contentSize = CGSize(width: 900, height: 300)
        
        bgScrollView.delegate = self
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        print(scrollView.contentOffset.x)
        
        if scrollView.contentOffset.x < 300 {
            
            view1.isUserInteractionEnabled = true
        }
    }
}
