//
//  DetailViewController.swift
//  AnotherIPadApplication
//
//  Created by Dmitrii Poliakov on 2017-09-11.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    var languageCode: String?
    var languageButton: UIBarButtonItem!

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem{
            
            var urlString = detail
            
            if languageCode != nil{
                
                let range = NSMakeRange(7, 2)
                urlString = (detail as NSString).replacingCharacters(in: range, with: languageCode!)
            }
            let url = URL(string: urlString)
            let urlRequest = URLRequest(url: url!)
            
            webView?.loadRequest(urlRequest)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
        webView.backgroundColor = UIColor.white
        
        languageButton = UIBarButtonItem(title: "Choose Language", style: .plain, target: self, action: #selector(DetailViewController.showLanguagePopover))
        navigationItem.rightBarButtonItem = languageButton
    }
    
    @objc func showLanguagePopover(){
        
        let languageList = LanguageListController()
        languageList.delegate = self
        
        languageList.modalPresentationStyle = UIModalPresentationStyle.popover
        languageList.popoverPresentationController?.barButtonItem = languageButton
        present(languageList, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var detailItem: String? {
        didSet {
            // Update the view.
            configureView()
        }
    }


}

