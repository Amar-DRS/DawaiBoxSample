//
//  Utility.swift
//  eManager
//
//  Created by amarjeet patel on 18/05/18.
//  Copyright © 2018 amarjeet patel. All rights reserved.
//
import UIKit

class Utility: NSObject {
    // MARK: Screen Size Properties
    // Screen width.
    public var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    // Screen height.
    public var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    
 
    
  
    // MARK: User Default Storage
    func SaveKeyValueinUserDefault(Key: String, Value: Any) {
        let kUserDefault = UserDefaults.standard
        kUserDefault.set(Value, forKey: Key)
        kUserDefault.synchronize()
    }
    func getValeForKeyFromUserDefault(Key: String)-> Any {
        let kUserDefault = UserDefaults.standard
        let result = kUserDefault.object(forKey: Key)
        return result as Any 
    }
    func RemoveKeyFromUserDefault(Key: String){
        UserDefaults.standard.removeObject(forKey: Key)
    }
    // MARK: Show Alert
    func showAlert(titleSTR:String,messageSTR:String,controller:UIViewController) {
        let alert = UIAlertController(title: titleSTR, message: messageSTR, preferredStyle: UIAlertControllerStyle.alert)
        
        let okaction = UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler:nil)
        alert.addAction(okaction)
        controller.present(alert, animated: true, completion: nil)
    }
    // MARK: String Length
    func CheckStringLength(inputString:String , length:NSInteger) -> Bool {
        if inputString.count >= length {
            return true
        }
        else
        {
        return false
        }
    }
    // MARK: Email Validation
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    // MARK: View Alter-corner,radiuos
    func LeftViewonTextfield(textField:UITextField, image:String)  {
   
        let myNewView=UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        let LeftimageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 20, height: 20))
        LeftimageView.image = UIImage(named: image)
        myNewView.addSubview(LeftimageView)
        textField.leftViewMode = UITextFieldViewMode.always
        textField.leftViewMode = .always
        textField.leftView = myNewView
    }
    
    func LeftViewWithoutImageOnTextfield(textField:UITextField, image:String)  {
        
        let myNewView=UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 40))
        let LeftimageView = UIImageView(frame: CGRect(x: 0, y: 10, width: 20, height: 20))
        LeftimageView.image = UIImage(named: image)
        myNewView.addSubview(LeftimageView)
        textField.leftViewMode = UITextFieldViewMode.always
        textField.leftViewMode = .always
        textField.leftView = myNewView
    }
    func RightViewWithoutImageOnTextfield(textField:UITextField, image:String)  {
        
        let myNewView=UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 30))
        let RightImageView = UIImageView(frame: CGRect(x: 0, y: 8, width: 15, height: 15))
        RightImageView.contentMode = .scaleAspectFit
        RightImageView.image = UIImage(named: image)
        myNewView.addSubview(RightImageView)
        textField.rightViewMode = UITextFieldViewMode.always
        textField.rightViewMode = .always
        textField.rightView = myNewView
    }
    
    func basicDropShadow(button:UIButton){
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 5.0
        button.layer.shadowOffset = CGSize(width: 5, height: 2)
        button.layer.shadowColor = UIColor.black.cgColor
    }
    func SetViewCornerRadious(radious:Float,inputView:UIView) {
        inputView.layer.cornerRadius = CGFloat(radious)
        inputView.layer.masksToBounds = true
    }
    func SetViewCornerRadiousWithBorder(radious:Float,inputView:UIView,Color:UIColor,width:Float) {
        inputView.layer.cornerRadius = CGFloat(radious)
        inputView.layer.masksToBounds = true
        inputView.layer.borderWidth = CGFloat(width)
        inputView.layer.borderColor = Color.cgColor
    }
    
    func MakeCircularView(inputView:UIView)
    {
    inputView.layer.masksToBounds = true
    inputView.layer.cornerRadius = inputView.frame.height/2
    inputView.clipsToBounds = true
    }
    func RemoveCircularView(inputView:UIView)
    {
        inputView.layer.masksToBounds = true
        inputView.layer.cornerRadius = inputView.frame.height
        inputView.clipsToBounds = true
    }
    func MakeCircularViewWithBorder(inputView:UIView)
    {
        inputView.layer.masksToBounds = true
        inputView.layer.cornerRadius = inputView.frame.height/2
        inputView.clipsToBounds = true
        inputView.layer.borderWidth=2.0
        inputView.layer.borderColor = UIColor.lightGray.cgColor
        
    }
    func MakeShadowOnViewWith(radious:Float,inputView:UIView,Color:UIColor,Opacity:Float) {
        inputView.layer.shadowColor = Color.cgColor
        inputView.layer.shadowOpacity = Opacity
        inputView.layer.shadowOffset = CGSize.zero
        inputView.layer.shadowRadius = CGFloat(radious)
    }

    // MARK: RGB from Hex
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
   
    func removeStringWithString(inputSTR:String)->(String)
    {
        let myStringArr = inputSTR.components(separatedBy: ".")
        return myStringArr[0]
    }
    func setLeftPaddingPoints(textField:UITextField)
    {
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width:5, height: textField.frame.height))
        textField.leftViewMode = .always
        
//        // Create a padding view for padding on right
//        textField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
//        textField.rightViewMode = .always
        
    }

}
