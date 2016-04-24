//
//  ConcertTableViewController.swift
//  simpletable
//
//  Created by Jason Meyer on 4/23/16.
//  Copyright © 2016 Jason Meyer. All rights reserved.
//

import UIKit

class ConcertTableViewController: UITableViewController, UISearchDisplayDelegate, UISearchBarDelegate {
    
    let searchController = UISearchController(searchResultsController: nil)
    var searchActive : Bool = false
    var filtereditems = [Concert]()
    var concerts = [Concert]()
    var initsample = false
    
    @IBOutlet var searchbar: UISearchBar!
    //@IBOutlet var mapbutton: UIButton!
    
    @IBOutlet var itemtable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
            
            // Load the sample data.
            searchbar.delegate = self
        if (!initsample){
            loadSampleConcerts()
        }
       
        
    }
    @IBAction func onFilterDateTapped(sender: AnyObject) {
        
    }
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        searchActive = true;
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
            //filter items by band,month,day
            filtereditems = concerts.filter({ (concert) -> Bool in
            let tmp: NSString = concert.band
            let range = tmp.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch)
                //search month
                if(range.location == NSNotFound){
                    let tmp: NSString = concert.month
                   
                    let range = tmp.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch)
                    //search day
                    if(range.location == NSNotFound){
                        let tmp: NSString = concert.day
                        
                        let range = tmp.rangeOfString(searchText, options: NSStringCompareOptions.NumericSearch)
                        return range.location != NSNotFound
                    }
                    else{
                        return range.location != NSNotFound

                    }
                }
                else{
                    return range.location != NSNotFound
                }
        })
        if(filtereditems.count == 0){
            searchActive = false;
        } else {
            searchActive = true;
        }
        self.tableView.reloadData()
    }
    
    func loadSampleConcerts() {
        initsample = true
        //let photo1 = UIImage(named: "meal1")!
        let concert1 = Concert(band: "Artist A", photo: UIImage(named:"DefaultPhoto"), month: "Apr", day: "25", location:"1805 Geary Blvd, San Francisco, CA 94115")!
        
        let concert2 = Concert(band: "Artist B", photo: UIImage(named:"DefaultPhoto"), month: "Sept", day: "5", location:"4 Pennsylvania Plaza, New York, NY 10001")!
        
        let concert3 = Concert(band: "Artist C", photo: UIImage(named:"DefaultPhoto"), month: "Oct", day: "12", location:"somewhere")!
        
        let concert4 = Concert(band: "Artist D", photo: UIImage(named:"DefaultPhoto"), month: "Aug", day: "7", location:"somewhere")!
        
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
        if(searchActive) {
            return filtereditems.count
        }
        else{
            return concerts.count
        }
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "ConcertTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! ConcertTableViewCell
        if(searchActive){
            let concert = filtereditems[indexPath.row]
            cell.bandname.text = concert.band
            cell.monthlabel.text = concert.month
            cell.datelabel.text = concert.day
            cell.venuelocation = concert.location
        }
        else{
        // Fetches the appropriate meal for the data source layout.
            let concert = concerts[indexPath.row]
            cell.bandname.text = concert.band
            cell.monthlabel.text = concert.month
            cell.datelabel.text = concert.day
            cell.venuelocation = concert.location
        
        }
        return cell
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if(segue.identifier == "showMapDetail") {
            //get index path
            let button = sender as! UIButton
            let view = button.superview!
            let cell = view.superview as! ConcertTableViewCell
            
            let indexPath = itemtable.indexPathForCell(cell)
            let NextViewController = (segue.destinationViewController as! MapViewController)
           
            
            let currentcell: ConcertTableViewCell = tableView.cellForRowAtIndexPath(indexPath!) as! ConcertTableViewCell!
            NextViewController.maplocation = currentcell.venuelocation
            
        }
        else if(segue.identifier == "showPhotoDetail") {
            
            let NextViewController = (segue.destinationViewController as! ConcertViewController)
            // Get the cell that generated this segue.
                let button = sender as! UIButton
                let view = button.superview!
                let selectedConcertCell = view.superview as! ConcertTableViewCell
                let indexPath = tableView.indexPathForCell(selectedConcertCell)!
                let selectedConcert = concerts[indexPath.row]
                print(indexPath.row)
                print(concerts[indexPath.row])
                NextViewController.concert = selectedConcert
                print(selectedConcert.band)
                
            
            
        }
    }
   

}
