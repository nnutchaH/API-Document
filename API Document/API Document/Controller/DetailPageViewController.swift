//
//  DetailPageViewController.swift
//  API Document
//
//  Created by Pony💛 yyy on 20/4/2563 BE.
//  Copyright © 2563 nnutcha. All rights reserved.
//

import UIKit

class DetailPageViewController: UIViewController {
    
    @IBOutlet weak var customerGradeLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var sexLabel: UILabel!
    
    let apiManager = APIManager()
    var loginData: Login!
    var customerData: Customer!
    var detailData: Detail!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getApiDetailPage()
    }
    
    func getApiDetailPage() {
        apiManager.postDetail(token: loginData.token, customerId: customerData.id) { [weak self] detailData in
            switch detailData {
            case .success(let data):
                self!.detailData = data
                self!.setupDetailUI()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func setupDetailUI() {
        customerGradeLabel.text = detailData.data.customerGrade
        idLabel.text = detailData.data.id
        nameLabel.text = detailData.data.name
        sexLabel.text = detailData.data.sex
    }
    
}
