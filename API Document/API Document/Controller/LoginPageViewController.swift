//
//  ViewController.swift
//  API Document
//
//  Created by Pony💛 yyy on 20/4/2563 BE.
//  Copyright © 2563 nnutcha. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    let apiManager = APIManager()
    var loginData: Login?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func pressedLogin(_ sender: Any) {
        apiManager.postLogin { [weak self] loginResponse in
            switch loginResponse {
            case .success(let data):
                self!.loginData = data
            case .failure(let error):
                print(error)
            }
            self!.performSegue(withIdentifier: "showDashboardDetail", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationViewController = segue.destination as? DashboardPageViewController
        destinationViewController?.loginData = loginData
    }
    
}

