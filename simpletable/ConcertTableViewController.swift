//
//  ConcertTableViewController.swift
//  simpletable
//
//  Created by Jason Meyer on 4/23/16.
//  Copyright © 2016 Jason Meyer. All rights reserved.
//

import UIKit

class ConcertTableViewController: UITableViewController {
    
    var concerts = [Concert]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
            
            // Load the sample data.
            loadSampleConcerts()
       
        
           }
    
    func loadSampleConcerts() {
        //let photo1 = UIImage(named: "meal1")!
        let concert1 = Concert(band: "Artist Name", photo: nil, month: "Apr", day: "25", location:"somewhere")!
        
        let concert2 = Concert(band: "Artist Name", photo: nil, month: "Sept", day: "5", location:"somewhere")!
        
        let concert3 = Concert(band: "Artist Name", photo: nil, month: "Oct", day: "12", location:"somewhere")!
        
        let concert4 = Concert(band: "Artist Name", photo: nil, month: "Aug", day: "7", location:"somewhere")!
        
        concerts += [concert1, concert2, concert3, concert4]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return concerts.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "ConcertTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! ConcertTableViewCell
        
        // Fetches the appropriate meal for the data source layout.
        let concert = concerts[indexPath.row]
        
        cell.bandname.text = concert.band
        cell.monthlabel.text = concert.month
        cell.datelabel.text = concert.day
        
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
