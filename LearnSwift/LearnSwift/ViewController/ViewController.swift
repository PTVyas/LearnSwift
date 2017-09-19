
//
//  ViewController.swift
//  LearnSwift
//
//  Created by WOS_iMac_2 on 8/23/17.
//  Copyright © 2017 WOS. All rights reserved.
//

import UIKit

let _kHelloWorld                    = "Hello World"
let _kAlert                         = "Alert"
let _kAlertAutoHide                 = "Alert (Auto Hide)"
let _kString                        = "String"
let _kTableView                     = "TableView"
let _kCollectionView                = "Collectionview"

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
 //MARK:- Outlet
    @IBOutlet weak var tblList: UITableView!
    
    var arrList:NSMutableArray = []
    
//MARK:-
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        arrList.add(_kHelloWorld)
        arrList.add(_kAlert)
        arrList.add(_kAlertAutoHide)
        //arrList.add(_kString)
        arrList.add(_kTableView)
        arrList.add(_kCollectionView)
        
        tblList.dataSource = self
        tblList.delegate = self
        tblList.tableFooterView = UIView.init(frame: .zero)
        tblList.separatorInset = .zero
        tblList.layoutMargins = .zero
        tblList.separatorColor = UIColor.clear
        
        //------------>
        //String Related Function
        var value : String
        value = "\n\n\nHello\n\nHi\n\n....\n\n"
        print(value);
        print("-------------------------------");
        print("Trimming String:\n",Function().trimmingString(strValue: value as String))
        print("Check string is Empty? - ",Function().string_Empty(strValue: value as String))
        print("Replace string (new line == _) - ",Function().replaceValueInString(mainString: value, replaceValue: "\n", toValue: "_"))
        value = " "
        print("Check string is Empty? - ",Function().string_Empty(strValue: value as String))
        print("PlaceHolder string - ",Function().placeHolderValue(value, "##"))        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
//MARK:- Table Delegate Methods
    func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int) -> Int
    {
        return arrList.count
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell:UITableViewCell=UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "mycell")
        
        cell.textLabel?.text = (arrList[indexPath.row] as! NSString) as String
        //cell.detailTextLabel?.text="subtitle#\(indexPath.row)"
        
        tableView.separatorColor = UIColor.darkGray
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        //[tableView.deselectRow(at: indexPath, animated: true)];
        
        let value = (arrList[indexPath.row] as! NSString) as String
        if value.uppercased() == _kHelloWorld.uppercased() {
            Function().showAlertMessage(Message: _kHelloWorld.uppercased(), AutoHide: false)
        }
        else if value.uppercased() == _kAlert.uppercased() {
            Function().showAlertMessage(Message: "Alert Message".uppercased(), AutoHide: false)
        }
        else if value.uppercased() == _kAlertAutoHide.uppercased()
        {
            Function().showAlertMessage(Message: "Alert Message\n(Auto Hide)".uppercased(), AutoHide: true)
            
        }
        else if value.uppercased() == _kString.uppercased()
        {
            
        }
        else if value.uppercased() == _kTableView.uppercased()
        {
            let objVC = self.storyboard?.instantiateViewController(withIdentifier: "TableVC") as! TableVC
            self.navigationController?.pushViewController(objVC, animated: true)
        }
        else if value.uppercased() == _kCollectionView.uppercased()
        {
            let objVC = self.storyboard?.instantiateViewController(withIdentifier: "CollectionVC") as! CollectionVC
            self.navigationController?.pushViewController(objVC, animated: true)
        }
        else
        {
            Function().showAlertMessage(Message: "Something was wronge.", AutoHide: false)
        }
    }
}
