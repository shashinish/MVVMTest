//
//  StaffTableViewController.swift
//  MVVMTest
//
//  Created by Shashi Nishantha on 11/8/19.
//  Copyright © 2019 Shashi Nishantha. All rights reserved.
//

import UIKit
import SwiftyDrop

class StaffTableViewController: UITableViewController {

    // Staff View Modal List
    var staffList:[StaffViewModal] = [StaffViewModal]()
    var selectedViewModal:StaffViewModal?
    
    
    var refresher:UIRefreshControl {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(fetchStaffData), for: .valueChanged)
        return refreshControl
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupView()
        self.fetchStaffData()
    }
    
    
    
    @objc func fetchStaffData(){
        Api.sharedInstance.fetchStaffData(success: { (staffResponse) in
            self.tableView.refreshControl?.endRefreshing()  // Refresh controller may stop if it is already running
            self.staffList = staffResponse.map({return StaffViewModal(staff: $0) })
            self.tableView.reloadData()
        }) { (error) in
            Drop.down(error.errorMessage!, state: .error)
            self.tableView.refreshControl?.endRefreshing()
        }
    }
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.staffList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "staffCellIdentifire", for: indexPath) as! StaffTableViewCell
        cell.staffViewModal = self.staffList[indexPath.row] // setting up the view modal

        return cell
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedViewModal = self.staffList[indexPath.row]
        self.performSegue(withIdentifier: "sgStaffDetai", sender: self)
    }
    
    
    func setupView(){
        
        // setup
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.tableView.estimatedRowHeight = 60
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.tableFooterView = UIView.init()
        self.tableView.refreshControl = self.refresher
        
    }
    
   
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "sgStaffDetai" {
            let viewController = segue.destination as? StaffDetailViewController
            viewController?.staffViewModal = self.selectedViewModal
        }
    }
    

}
