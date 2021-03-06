//
//  Function.swift
//  LearnSwift
//
//  Created by WOS_iMac_2 on 8/23/17.
//  Copyright © 2017 WOS. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
import SystemConfiguration
import Foundation

class Function: NSObject
{
    //MARK:- AlertView
    func showAlertMessage(Message: String, AutoHide:Bool) -> Void {
        DispatchQueue.main.async {
        let alert = UIAlertController(title: Message, message: nil, preferredStyle: UIAlertControllerStyle.alert)
        
        if AutoHide == true {
            //alert.dismiss(animated: true, completion:nil)
            
            let deadlineTime = DispatchTime.now() + .seconds(1)
            DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
                print("Alert Dismiss")
                alert.dismiss(animated: true, completion:nil)
            }
        }
        else {
            alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: nil))
        }
        UIApplication.shared.windows[0].rootViewController?.present(alert, animated: true, completion: nil)
        }
    }
    
    //MARK:- String
    
    func trimmingString(strValue: String) -> String {
        let trimmedString = strValue.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmedString
    }
    
    func string_Empty(strValue: String) -> Bool {
        var value = String()
        value = self.trimmingString(strValue: strValue)
        
        if (value.isEmpty == true
            || value == ""
            || value == "(null)"
            || value == "<null>"
            || value.uppercased() == "<null>".uppercased()
            || value.lowercased() == "<null>".lowercased()) {
            return true
        }
        else {
            return false
        }
    }
    
    func placeHolderValue(_ strValue1: String , _ strValue2: String ) -> String {
        var value = String()
        value = self.trimmingString(strValue: strValue1)
        
        if (self.string_Empty(strValue: value) == true) {
            value = strValue2
        }
        return value
    }
    
    func string_ReplaceValues(strString: NSString, FromValue: NSString, ToValues: NSString) -> NSString {
        var value = String()
        value = self.trimmingString(strValue: mainString)
        let result = value.replacingOccurrences(of: FromValue as String, with: ToValues as String)
        return result as NSString
    }
    
    //MARK:- Number
    func valueIsnagative (value: Int) -> Bool {
        if (value >= 0) {
            return false
        }
        return true
    }
    
    //MARK:- Button
    func setButtonDesign(btnObj: UIButton, bgColor: UIColor, txtColor: UIColor, btnTextFont: String, btnTextFontSize : Int ) -> UIButton {
        btnObj.backgroundColor = bgColor //BG Coloe
        btnObj.titleLabel?.textColor = txtColor; //Title Text Color
        btnObj.titleLabel?.font = UIFont(name: btnTextFont, size: CGFloat(btnTextFontSize)) //Title Text FontName and FontSize
        return btnObj
    }
    
    //MARK:- Label
    func setLabelDesign(lblObj: UILabel, txtColor: UIColor, textFont: String, textFontSize : Int ) -> UILabel {
        lblObj.textColor = txtColor; //Text Color
        lblObj.font = UIFont(name: textFont, size: CGFloat(textFontSize)) //Title Text FontName and FontSize
        return lblObj
    }
    
    //MARK:- Validation
    func validation_ValidEmail(strValue:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: strValue)
    }
    
    func checkRegularExressions( regEx: String, strValue: String) -> Bool {
        //if strValue.ra
        //range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
        return false
    }
    
    //MARK:- TextField
    //MyFunction().AddImage(TextField: txtCity, ImageName: "icon_Down_gray", Frame: CGRect(x: 0, y: 0, width: txtCity.frame.height*0.80, height: txtCity.frame.height/2), backgroundColor: UIColor.clear, setLeftSize: false)
    func AddImage(TextField: UITextField, ImageName:String, Frame:CGRect, backgroundColor:UIColor, setLeftSize: Bool)
    {
        let View = UIView(frame: Frame)
        View.backgroundColor = backgroundColor
        
        let imageView = UIImageView(frame: Frame)
        imageView.image = UIImage(named: ImageName)
        imageView.contentMode = UIViewContentMode.scaleAspectFit
        
        View.addSubview(imageView)
        
        if setLeftSize == true {
            TextField.leftViewMode = .always
            TextField.leftView = View
        }
        else {
            TextField.rightViewMode = .always
            TextField.rightView = View
        }
    }
    
    
    //MARK:- Comman
    func printSystemFont() -> Void {
        UIFont.familyNames.forEach({ familyName in
            let fontNames = UIFont.fontNames(forFamilyName: familyName)
            print(familyName, fontNames)
        })
    }
    func getRandomColor() -> UIColor {
        let randomRed:CGFloat = CGFloat(drand48())
        let randomGreen:CGFloat = CGFloat(drand48())
        let randomBlue:CGFloat = CGFloat(drand48())
        
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 0.35)
    }
    
    func setCornerRadius( objLayer: CALayer, radiusValue:CGFloat) -> Void {
        objLayer.cornerRadius = radiusValue
        objLayer.masksToBounds = true
    }
    
    func setBorderWidth( objLayer: CALayer, widthValue:CGFloat, borderColor:UIColor) -> Void {
        objLayer.borderColor = borderColor.cgColor
        objLayer.borderWidth = widthValue
        objLayer.masksToBounds = true
    }
    
    func setShadow( objLayer: CALayer, shadowColor:UIColor, shadowOpacity: CGFloat, shadowOffset: CGSize,  shadowRadius: CGFloat) -> Void {
        
        objLayer.masksToBounds = false
        objLayer.shadowColor = shadowColor.cgColor
        objLayer.shadowOffset = shadowOffset
        objLayer.shadowRadius = shadowRadius
        
        objLayer.shadowPath = UIBezierPath(rect: objLayer.bounds).cgPath
        objLayer.shouldRasterize = true
    }
    
    //MARK:- Animation
    func animation_shakeAnimation_onTextField(txtObj: UITextField) -> Void {
        txtObj.layer.removeAllAnimations()
        
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.7
        animation.repeatCount = 6
        animation.autoreverses = true
        //animation.fromValue = NSValue(cgPoint: CGPointMake(txtObj.center.x - 10, txtObj.center.y))
        //animation.toValue = NSValue(cgPoint: CGPointMake(txtObj.center.x + 10, txtObj.center.y))
        txtObj.layer.add(animation, forKey: "position")
    }
}
