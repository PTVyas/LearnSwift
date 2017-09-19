//
//  SectionCollectionVC.swift
//  LearnSwift
//
//  Created by Bhargav on 28/08/17.
//  Copyright © 2017 WOS. All rights reserved.
//

import UIKit

class SectionCollectionVC: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    @IBOutlet weak var Collection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Button Action Methods
    @IBAction func btnBackAction() {
        _ = navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Collection Delegate Methods
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        var width = (self.view.frame.size.width - 5 ) / 6 //some width
        var height = width //ratio
        
        let orientation = UIApplication.shared.statusBarOrientation
        if(orientation == .landscapeLeft || orientation == .landscapeRight)
        {
            width = (self.view.frame.size.width - 11) / 12
            height = width
        }
        else
        {
            
        }
        return CGSize(width: width, height: height);
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        //cell.myLabel.text = self.items[indexPath.item]
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1.8
        
        cell.backgroundColor = Function().getRandomColor()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        Function().showAlertMessage(Message: "You selected cell \n'\(indexPath.item)'", AutoHide: false)
    }
}
