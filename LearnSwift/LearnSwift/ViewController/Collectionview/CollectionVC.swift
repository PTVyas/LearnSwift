//
//  CollectionVC.swift
//  LearnSwift
//
//  Created by Bhargav on 26/08/17.
//  Copyright © 2017 WOS. All rights reserved.
//

import UIKit

let _kCollection_Static:NSString                 = "Static Collectionview Cell"
let _kCollection_CustomeCell:NSString            = "Custome Collectionview Cell"
let _kCollection_Header:NSString                 = "Header (Section) Collectionview"
let _kCollection_CustomeHeader:NSString          = "Custome Header (Section) Collectionview"

class CollectionVC: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet weak var tblList: UITableView!
    var arrCollectionList:NSMutableArray = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        tblList.tableFooterView = UIView.init(frame: .zero)
        tblList.separatorInset = .zero
        tblList.layoutMargins = .zero
        
        [arrCollectionList.add(_kCollection_Static)];
        [arrCollectionList.add(_kCollection_CustomeCell)];
        //[arrCollectionList.add(_kCollection_Header)];
        //[arrCollectionList.add(_kCollection_CustomeHeader)];
   }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Navigation
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
        return arrCollectionList.count
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell:UITableViewCell=UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "mycell")
        cell.textLabel?.text = (arrCollectionList[indexPath.row] as! NSString) as String
        //cell.detailTextLabel?.text="subtitle#\(indexPath.row)"
        
        tableView.separatorColor = UIColor.darkGray
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true);
        
        let value = (arrCollectionList[indexPath.row] as! NSString) as String
        if (value == _kCollection_Static as String) {
            let objVC = self.storyboard?.instantiateViewController(withIdentifier: "CollectionviewVC") as! CollectionviewVC
            self.navigationController?.pushViewController(objVC, animated: true)
        }
        else if (value == _kCollection_CustomeCell as String) {
            let objVC = self.storyboard?.instantiateViewController(withIdentifier: "CustomeCollectionviewVC") as! CustomeCollectionviewVC
            self.navigationController?.pushViewController(objVC, animated: true)
        }
        else if (value == _kCollection_Header as String) {
            let objVC = self.storyboard?.instantiateViewController(withIdentifier: "SectionCollectionVC") as! SectionCollectionVC
            self.navigationController?.pushViewController(objVC, animated: true)
        }
        else if (value == _kCollection_CustomeHeader as String) {
            let objVC = self.storyboard?.instantiateViewController(withIdentifier: "CustomeCollectionviewVC") as! CustomeCollectionviewVC
            self.navigationController?.pushViewController(objVC, animated: true)
        }
        else
        {
            Function().showAlertMessage(Message: "Something was wronge.", AutoHide: false)
        }
    }
}
