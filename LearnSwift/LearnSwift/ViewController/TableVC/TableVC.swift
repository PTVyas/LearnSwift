//
//  TableVC.swift
//  LearnSwift
//
//  Created by WOS_iMac_2 on 8/23/17.
//  Copyright © 2017 WOS. All rights reserved.
//

import UIKit

let _kTable_Static:NSString                 = "Static Cell Table"
let _kTable_CustomeCell:NSString            = "Custome Cell Table"
let _kTable_MoreOption:NSString             = "More Option in Cell Table"
let _kTable_Header:NSString                 = "Header (Section) Table"
let _kTable_CustomeHeader:NSString          = "Custome Header (Section) Table"

class TableVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //MARK : - Outlet
    @IBOutlet weak var tblTableTypeList: UITableView!
    
    var arrTableList:NSMutableArray = []
    
    //MARK : -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblTableTypeList.tableFooterView = UIView.init(frame: .zero)
        tblTableTypeList.separatorInset = .zero
        tblTableTypeList.layoutMargins = .zero
        tblTableTypeList.separatorColor = UIColor.clear
        tblTableTypeList.rowHeight = 60
        
        [arrTableList.add(_kTable_Static)];
        [arrTableList.add(_kTable_CustomeCell)];
        [arrTableList.add(_kTable_MoreOption)];
        [arrTableList.add(_kTable_Header)];
        [arrTableList.add(_kTable_CustomeHeader)];
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Button Action Methods
    @IBAction func btnBackAction() {
        
      _ = navigationController?.popViewController(animated: true)
    }
    
    // MARK: - TableView Delegate Methods
    func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int) -> Int
    {
        return arrTableList.count
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        //let cell:UITableViewCell=UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "mycell")
        //cell.textLabel?.text = (arrTableList[indexPath.row] as! NSString) as String
        //cell.detailTextLabel?.text="subtitle#\(indexPath.row)"
        
        let cell:TableVC_CustomeCell = tableView.dequeueReusableCell(withIdentifier: "mycell") as! TableVC_CustomeCell
        let value = (arrTableList[indexPath.row] as! NSString) as String
        
        cell.imgLogo?.image = cell.imgLogo?.image
        cell.lblTitle?.text = value
        cell.imgDetails?.isHidden = true
        
        if (value == _kTable_Static as String || value == _kTable_CustomeCell as String || value == _kTable_MoreOption as String )
        {
            cell.imgDetails?.isHidden = true
        }
        else
        {
            cell.imgDetails?.isHidden = false
        }
        
        tableView.separatorColor = UIColor.darkGray
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true);
        
        let value = (arrTableList[indexPath.row] as! NSString) as String
        if value == _kTable_Static as String
        {
            Function().showAlertMessage(Message: "Home screen visible table cell's are Static Cell Table", AutoHide: false)
        }
        else if value == _kTable_CustomeCell as String
        {
            Function().showAlertMessage(Message: "Current visible cell's are Custome Cell Table", AutoHide: false)
        }
        else if value == _kTable_MoreOption as String
        {
            Function().showAlertMessage(Message: "Swipe the particular cell right-side to left-side and show the option buttons.", AutoHide: false)
        }
        else if value == _kTable_Header as String
        {
            let objVC = self.storyboard?.instantiateViewController(withIdentifier: "SectionTableVC") as! SectionTableVC
            self.navigationController?.pushViewController(objVC, animated: true)
        }
        else if value == _kTable_CustomeHeader as String
        {
            let objVC = self.storyboard?.instantiateViewController(withIdentifier: "CustomeSectionTableVC") as! CustomeSectionTableVC
            self.navigationController?.pushViewController(objVC, animated: true)
        }
        else
        {
            Function().showAlertMessage(Message: "Something was wronge.", AutoHide: false)
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true;
    }
    
    
    
    func tableView(_ tableView: UITableView, editActionsForRowAt: IndexPath) -> [UITableViewRowAction]? {
        let more = UITableViewRowAction(style: .normal, title: "More") { action, index in
            Function().showAlertMessage(Message: "'More'\n button tapped", AutoHide: true)
        }
        more.backgroundColor = .black
        
        let favorite = UITableViewRowAction(style: .normal, title: "Favorite") { action, index in
            Function().showAlertMessage(Message: "'Favorite'\n button tapped", AutoHide: true)
        }
        favorite.backgroundColor = .darkGray
        
        let share = UITableViewRowAction(style: .normal, title: "Share") { action, index in
            Function().showAlertMessage(Message: "'Share'\n button tapped", AutoHide: true)
        }
        share.backgroundColor = .lightGray
        
        return [share, favorite, more]
    }
}
