//
//  InfoVC.swift
//  BullsEye
//
//  Created by Ahmed Shoman on 9/28/20.
//  Copyright © 2020 Ahmed Shoman. All rights reserved.
//

import UIKit
import WebKit

class InfoVC: UIViewController {
    //MARK: - Constant
    
    
    //MARK: - Outlets
    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpWeb()
    }
    //MARK: - IBAction
    @IBAction func BackBTN(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK: - HelperFunction
    func setUpWeb()  {
        let urlPath = Bundle.main.path(forResource: "BullsEye", ofType: "html")!
        
         let urlRequest = URL(fileURLWithPath: urlPath)
        let htmlRequst = URLRequest(url: urlRequest)
        
        webView.load(htmlRequst)
    }
}
