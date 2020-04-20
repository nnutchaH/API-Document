//
//  DashBoardPageTableViewCell.swift
//  API Document
//
//  Created by Pony💛 yyy on 20/4/2563 BE.
//  Copyright © 2563 nnutcha. All rights reserved.
//

import UIKit

class DashBoardPageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    func setupDashboardPageUI(customer: Customer) {
        idLabel.text = customer.id
        nameLabel.text = customer.name
    }
    
}
