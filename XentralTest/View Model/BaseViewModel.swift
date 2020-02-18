//
//  BaseViewModel.swift
//  XentralTest
//
//  Created by Ayus Salleh on 17/02/2020.
//  Copyright © 2020 Ayus_Salleh. All rights reserved.
//

import UIKit

class BaseViewModel {

    var alertMessage: String? {
        didSet {
            self.showAlertClosure?()
        }
    }
    
    var showAlertClosure: (()->())?

}
