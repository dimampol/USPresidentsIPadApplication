//
//  LanguageListController.swift
//  AnotherIPadApplication
//
//  Created by Dmitrii Poliakov on 2017-09-11.
//  Copyright © 2017 apple. All rights reserved.
//

import Foundation
import UIKit

class LanguageListController: UITableViewController{
    
    weak var delegate: DetailViewController?
    
    var languageNames: [String]!
    var languageCodes: [String]!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        languageNames = ["English", "French", "German", "Spanish"]
        languageCodes = ["en", "fr", "de", "es"]
        
        self.clearsSelectionOnViewWillAppear = false
        self.preferredContentSize = CGSize(width: 320, height: CGFloat(self.languageNames.count) * 44)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return languageNames?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: "")
        cell.textLabel?.text = languageNames[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        delegate!.languageCode = languageCodes[indexPath.row]
        delegate!.configureView()
        
        self.dismiss(animated: true, completion: nil)
    }
}
