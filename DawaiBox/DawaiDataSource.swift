//
//  DawaiDataSource.swift
//  DawaiBox
//
//  Created by Apple on 29/07/18.
//  Copyright © 2018 AmarDRS. All rights reserved.
//

import UIKit

class DawaiDataSource: NSObject,UITableViewDataSource {
   let utility = Utility()
    var DataARR = CommonModel.sharedInstance.DawaiArr
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        DataARR = CommonModel.sharedInstance.DawaiArr
        return DataARR.count
    }
    // MARK: - TableView Delegate Cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DawaiCell", for: indexPath) as! DawaiCell
        cell.selectionStyle = .none
        cell.dawaiNameLBL.text = String(describing:DataARR[indexPath.row][drugNameKey]!)
        utility.MakeCircularViewWithBorder(inputView: cell.infoLBL)
        return cell
    }
}
