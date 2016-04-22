//
//  ViewController.swift
//  simpletable
//
//  Created by Jason Meyer on 4/21/16.
//  Copyright © 2016 Jason Meyer. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let concerts = [
    "Concert1", "Concert2", "Concert3", "Concert4"
    ]
    
    
    
    
    let simpleTableIdentifier = "SimpleTableIdentifier"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return concerts.count
    }
    
    func tableView(tableView: UITableView,
                   cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(
            simpleTableIdentifier) as UITableViewCell!
        if (cell == nil) {
            cell = UITableViewCell(
                style: UITableViewCellStyle.Default,
                reuseIdentifier: simpleTableIdentifier)
        }
        
        cell!.textLabel!.text = concerts[indexPath.row]
        return cell!
    }
    
}

