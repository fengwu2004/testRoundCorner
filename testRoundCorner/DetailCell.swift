//
//  DetailCell.swift
//  testRoundCorner
//
//  Created by aliasyan on 2019/3/19.
//  Copyright © 2019 yellfun. All rights reserved.
//

import UIKit

class DetailCell: UITableViewCell {
    
    @IBOutlet weak var currentPrice:UILabel!
    
    @IBOutlet weak var currentIncrease:UILabel!
    
    @IBOutlet weak var totalAmount:UILabel!
    
    @IBOutlet weak var turnoverRate:UILabel!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        
        super.setSelected(selected, animated: animated)
    }

    func updatedDetail() -> Void {
        
        currentPrice.text = "123"
        
        currentIncrease.text = "1%"
        
        currentIncrease.textColor = UIColor.red
        
        totalAmount.text = "1.5万"
        
        turnoverRate.text = "11.2%"
    }
    
}
