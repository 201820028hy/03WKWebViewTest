//
//  ViewController.swift
//  03WKWebViewTest
//
//  Created by dit03 on 2019. 9. 19..
//  Copyright © 2019년 201820028. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, UISearchBarDelegate, WKNavigationDelegate {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var forwardButton: UIBarButtonItem!
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        searchBar.delegate = self
        
        let request = URLRequest(url: URL(string: "http://www.naver.com")!)
        webView.load(request)
        
        backButton.isEnabled = self.webView.canGoBack
        forwardButton.isEnabled = self.webView.canGoForward
        
        webView.navigationDelegate = self
        
        indicator.isHidden = true
        
    }
    
    //UISearchBarDelegate메소드
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let input = searchBar.text
        print(input!)
        let request = URLRequest(url: URL(string: input!)!)
        webView.load(request)
    }

    @IBAction func backAction(_ sender: Any) {
            self.webView.goBack()
    }
    
    @IBAction func reloadAction(_ sender: Any) {
        self.webView.reload()
    }
    
    @IBAction func forwardAction(_ sender: Any) {
            self.webView.goForward()
    }
    
    //WKNavigationDelegate Method
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        indicator.isHidden = false
        indicator.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        backButton.isEnabled = self.webView.canGoBack
        forwardButton.isEnabled = self.webView.canGoForward
        
        indicator.stopAnimating()
        indicator.isHidden = true
    }
    
}

