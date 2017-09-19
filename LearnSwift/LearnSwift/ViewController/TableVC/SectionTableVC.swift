//
//  SectionTableVC.swift
//  LearnSwift
//
//  Created by Bhargav on 26/08/17.
//  Copyright © 2017 WOS. All rights reserved.
//

import UIKit

class SectionTableVC: UIViewController,UITableViewDataSource, UITableViewDelegate {

    //MARK : - Outlet
    @IBOutlet weak var tblList: UITableView!
    
    //------------------------------------------------------>
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblList.dataSource = self
        tblList.delegate = self
        tblList.tableFooterView = UIView.init(frame: .zero)
        tblList.separatorInset = .zero
        tblList.layoutMargins = .zero
        tblList.separatorColor = UIColor.clear
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - 
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Button Action Methods
    @IBAction func btnBackAction() {
        _ = navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Table Delegate Methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return " Section : \(section+1)"
    }
    
    func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int) -> Int
    {
        return 5
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell:UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "mycell")
        
        cell.textLabel?.text = " Title__\(indexPath.row+1)"
        //cell.detailTextLabel?.text = "subtitle#\(indexPath.row)"
        
        tableView.separatorColor = UIColor.darkGray
        return cell
    }
}
