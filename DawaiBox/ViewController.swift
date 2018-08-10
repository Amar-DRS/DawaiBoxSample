//
//  ViewController.swift
//  DawaiBox
//
//  Created by Apple on 28/07/18.
//  Copyright © 2018 AmarDRS. All rights reserved.
//

import UIKit
//import SVProgressHUD

class ViewController: UIViewController,UITableViewDelegate {
    @IBOutlet weak var searchBTN: UIButton!
    @IBOutlet weak var searchTXT: UITextField!
    @IBOutlet weak var DawaiTBL: UITableView!
    let utility = Utility()
    let dataSource = DawaiDataSource()
    var currentIndex = 0
    var drugArr = [[String : Any]]()
    let refreshControl = UIRefreshControl()
    var TotalRecorCount = 0
    @IBOutlet weak var NoDrugLBL: UILabel!
    var searchString = ""
    var actInd: UIActivityIndicatorView = UIActivityIndicatorView()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden=true
        DawaiTBL.delegate=self
        DawaiTBL.dataSource=dataSource
        
        utility.SetViewCornerRadiousWithBorder(radious: 5.0, inputView: searchBTN, Color: UIColor.lightGray, width: 1.0)
        utility.SetViewCornerRadiousWithBorder(radious: 10.0, inputView: searchTXT, Color: UIColor.lightGray, width: 1.0)
        utility.setLeftPaddingPoints(textField: searchTXT)
        showActivityIndicatory(uiView: self.view)
        DawaiDataAPI()
        
        refreshControl.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        refreshControl.tintColor = UIColor.gray
        DawaiTBL.addSubview(refreshControl)
    }
    
    func showActivityIndicatory(uiView: UIView) {
        actInd.frame = CGRect(x:0.0, y:0.0, width:40.0, height:40.0);
        actInd.center = uiView.center
        actInd.hidesWhenStopped = true
        actInd.activityIndicatorViewStyle =
            UIActivityIndicatorViewStyle.gray
        uiView.addSubview(actInd)
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden=true

    }
    @IBAction func searchAction(_ sender: Any) {
        currentIndex=0
        CommonModel.sharedInstance.DawaiArr=[]
        searchValidation(text: searchTXT)
        DawaiDataAPI()
      }
    
    @objc func handleRefresh()
    {
        DawaiDataAPI()
        DawaiTBL.reloadData()
        refreshControl.endRefreshing()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainView = storyboard.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
       // mainView.modalTransitionStyle = .flipHorizontal
        mainView.DetailDict=CommonModel.sharedInstance.DawaiArr[indexPath.row] as[String:Any]
        self.navigationController?.pushViewController(mainView, animated: true)
      //  self.present(mainView, animated: true, completion: nil)
    }
    
    func searchValidation(text:UITextField)  {
        searchString = text.text!.trimmingCharacters(in: .whitespacesAndNewlines)

    }
    // MARK: - Dashbard Data API
    func DawaiDataAPI()
    {
        
        view.endEditing(true)
        actInd.startAnimating()

        let inputString = IDKey + IDValueKey + RoleKey + RoleValueKey + SearchTextKey + searchString + LimitKey + LimitValueKey + StartIndexKey + String(currentIndex)
        
        APIManager.sharedInstance.getDawaiData(SearchString: inputString,    onSuccess: { json in
            let ResponseDic = json[responseDataKey].dictionaryObject
            print(ResponseDic as Any)
            if  (ResponseDic![responseCodeKey] as! String)==successCode
            {
              //  SVProgressHUD.dismiss()pa
                DispatchQueue.main.async {
                    print(json)
                    self.DawaiTBL.isHidden=false

                    self.actInd.stopAnimating()

                    let oldDataArr = CommonModel.sharedInstance.DawaiArr
                    let RefreshDataArr = json.dictionaryObject![drugListKey] as! [[String : Any]]

                    CommonModel.sharedInstance.DawaiArr = oldDataArr + RefreshDataArr
                    self.DawaiTBL.reloadData()
                    self.currentIndex=self.currentIndex+1
                }
            }
           else  if  (ResponseDic![responseCodeKey] as! String)==NoDrogCode
            {
                //  SVProgressHUD.dismiss()pa
                DispatchQueue.main.async {
                    self.actInd.stopAnimating()
                    if self.currentIndex==0
                        {
                            self.DawaiTBL.isHidden=true
                        }
                    else
                        {
                            self.DawaiTBL.isHidden=false

                    }
                        print(json)
                  //  CommonModel.sharedInstance.DawaiArr = [[String : Any]]()
                    self.DawaiTBL.reloadData()
                }
            }
            else
            {
                DispatchQueue.main.async {
                   // SVProgressHUD.dismiss()
                    self.actInd.stopAnimating()
                    if self.currentIndex==0
                    {
                        self.DawaiTBL.isHidden=true
                    }
                    else
                    {
                        self.DawaiTBL.isHidden=false
                        
                    }
                    print(json)
                }
            }
        }, onFailure: { error in
            DispatchQueue.main.async {
            }
        })
    }
}

