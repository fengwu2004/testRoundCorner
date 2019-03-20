//
//  TestMJRefreshViewController.swift
//  testRoundCorner
//
//  Created by aliasyan on 2019/3/18.
//  Copyright © 2019 yellfun. All rights reserved.
//

import UIKit

class TestMJRefreshViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var bgScrollView:UIScrollView!
    
    @IBOutlet weak var rightScrollView:UIScrollView!
    
    @IBOutlet weak var nameTableView:UITableView!
    
    @IBOutlet weak var detailTableView:UITableView!
    
    var items = [Int]()
    
    override func viewDidLoad() {
        
        weak var weakself = self
        
        bgScrollView.delegate = self
        
        nameTableView.isScrollEnabled = false
        
        nameTableView.clipsToBounds = true
        
        detailTableView.isScrollEnabled = false
        
        detailTableView.clipsToBounds = true
        
        detailTableView.register(UINib(nibName: "DetailCell", bundle: nil), forCellReuseIdentifier: "DetailCell")
        
        bgScrollView.mj_header = MJRefreshNormalHeader(refreshingBlock: {
            
            let strongself = weakself
            
            strongself?.onAsyncReload()
        })
        
        super.viewDidLoad()
        
        for i in 0..<100 {
            
            items.append(i)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        bgScrollView.contentSize = CGSize(width: nameTableView.bounds.width + rightScrollView.bounds.width, height: nameTableView.contentSize.height)
        
        print("zz")
    }
    
    func onAsyncReload() -> Void {
        
        for i in 0..<100 {
            
            items[i] = items[i] + 100
        }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + DispatchTimeInterval.milliseconds(500), execute: {
            
            self.bgScrollView.mj_header.endRefreshing()
            
            self.nameTableView.reloadData()
            
            self.detailTableView.reloadData()
        })
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == nameTableView {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell") ?? UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "MyCell")
            
            cell.textLabel?.text = "\(items[indexPath.row])"
            
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell") as! DetailCell
        
        cell.updatedDetail()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 44
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        var contentOffsetY = scrollView.contentOffset.y
        
        if contentOffsetY < 0 {
            
            contentOffsetY = 0
        }
        
        if scrollView == bgScrollView {
            
            nameTableView.contentOffset = CGPoint(x: 0, y: contentOffsetY)
            
            detailTableView.contentOffset = CGPoint(x: detailTableView.contentOffset.x, y: contentOffsetY)
        }
    }
}
