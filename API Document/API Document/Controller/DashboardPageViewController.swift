//
//  DashboardPageViewController.swift
//  API Document
//
//  Created by Pony💛 yyy on 20/4/2563 BE.
//  Copyright © 2563 nnutcha. All rights reserved.
//

import UIKit

class DashboardPageViewController: UIViewController {
    
    @IBOutlet weak var dashboardTableView: UITableView!
    
    var loginData: Login!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationViewController = segue.destination as? DetailPageViewController
        let selectedCustomerAtIndex = dashboardTableView.indexPathForSelectedRow?.row
        
        destinationViewController?.loginData = loginData
        destinationViewController?.customerData = loginData.customers[selectedCustomerAtIndex!]
    }
    
}

extension DashboardPageViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return loginData.customers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DashBoardPageTableViewCell", for: indexPath) as! DashBoardPageTableViewCell
        let customer = loginData.customers[indexPath.row]
        cell.setupDashboardPageUI(customer: customer)
        return cell
    }
    
}
