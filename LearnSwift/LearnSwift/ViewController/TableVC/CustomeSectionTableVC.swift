//
//  CustomeSectionTableVC.swift
//  LearnSwift
//
//  Created by Bhargav on 26/08/17.
//  Copyright © 2017 WOS. All rights reserved.
//

import UIKit

class CustomeSectionTableVC: UIViewController,UITableViewDataSource, UITableViewDelegate {

    //MARK : - Outlet
    @IBOutlet weak var tblList: UITableView!
    
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
        return 15
    }
    
    /*
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return " Section : \(section+1)"
    }
    */
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        let cell:TableVC_CustomeCell = tableView.dequeueReusableCell(withIdentifier: "mySection") as! TableVC_CustomeCell
        let value = " Section : \(section+1)"
        
        cell.imgLogo?.image = cell.imgLogo?.image
        cell.lblTitle?.text = value
        //cell.imgDetails?.isHidden = true
        
        cell.backgroundColor = UIColor.lightGray
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
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
