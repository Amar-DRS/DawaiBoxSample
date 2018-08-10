//
//  Constant.swift
//  eManager
//
//  Created by amarjeet patel on 18/05/18.
//  Copyright © 2018 amarjeet patel. All rights reserved.
//

import Foundation
public let OKButtonTitle = "OK"

//Key
//API
    public let responseDataKey                 = "response"
    public let responseCodeKey                 = "statusCode"
    public let responseMessageKey              = "message"

    public let BaseURL                         = "http://ec2-13-126-246-3.ap-south-1.compute.amazonaws.com/"
    public let searchMthod                     = "DawaiBoxSmartPrescription/searchdrugs?"
    public let IDKey                           = "Id="
    public let IDValueKey                      = "5594"
    public let RoleKey                         = "&role="
    public let RoleValueKey                    = "User"
    public let SearchTextKey                   = "&SearchText="
    public let LimitKey                        = "&limit="
    public let LimitValueKey                   = "10"
    public let StartIndexKey                   = "&start="

// API response Key
    public let successCode                     = "DB200"
    public let NoDrogCode                     = "DB504"

    public let drugListKey                     = "drugList"
    public let compoundKey                     = "compound"
    public let drugNameKey                     = "drugName"
    public let pharmaCompNameKey               = "pharmaCompName"
    public let drugIndicationsKey              = "drugIndications"
    public let drugInteractionsKey             = "drugInteractions"
    public let drugContraIndicationsKey        = "drugContraIndications"
    public let totalCountKey                   = "totalCount"


