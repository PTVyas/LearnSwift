//
//  TableVC_CustomeCell.swift
//  LearnSwift
//
//  Created by Bhargav on 26/08/17.
//  Copyright © 2017 WOS. All rights reserved.
//

import UIKit

class TableVC_CustomeCell: UITableViewCell {

    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgDetails: UIImageView!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        
        imgLogo.layer.cornerRadius = imgLogo.frame.height/2;
        imgLogo.layer.masksToBounds = true;
        
        lblTitle.numberOfLines = 0;
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
