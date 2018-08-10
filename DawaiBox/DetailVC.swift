//
//  DetailVC.swift
//  DawaiBox
//
//  Created by Apple on 28/07/18.
//  Copyright © 2018 AmarDRS. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    var DetailDict = [String : Any]()
    @IBOutlet weak var coumpoundLBL: UILabel!
    @IBOutlet weak var nameLBL: UILabel!
    @IBOutlet weak var companyLBL: UILabel!
    let utility = Utility()
    @IBOutlet weak var indicationLBL: UILabel!
    @IBOutlet weak var interactionLBL: UILabel!
    
    @IBOutlet weak var ContainerVW: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(DetailDict)
        utility.SetViewCornerRadiousWithBorder(radious: 5.0, inputView: ContainerVW, Color: UIColor.lightGray, width: 1.0)
        self.navigationController?.isNavigationBarHidden=false
        companyLBL.text=String(describing:DetailDict[pharmaCompNameKey]!)
        coumpoundLBL.text=String(describing:DetailDict[compoundKey]!)
        nameLBL.text=String(describing:DetailDict[drugNameKey]!)
        indicationLBL.text=String(describing:DetailDict[drugIndicationsKey]!)
        interactionLBL.text=String(describing:DetailDict[drugInteractionsKey]!)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func CancelBTNAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)

    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
