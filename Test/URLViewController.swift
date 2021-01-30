//
//  URLViewController.swift
//  Test
//
//  Created by Роман Зобнин on 29.01.2021.
//

import UIKit
import WebKit

class URLViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        webView.load(URLRequest(url: (URL(string: "http://www.icndb.com/api/")!)))
    
        }
    }

