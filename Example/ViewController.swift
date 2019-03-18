//
//  ViewController.swift
//  Example
//
//  Created by donyau on 2019/3/5.
//  Copyright © 2019 Yolanda. All rights reserved.
//

import UIKit
import DYMobileMode

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(DYMobileMode.isIphonePlus ? "iphonePlus" : "no iphonePlus")
        print(DYMobileMode.isIphoneX ? "iphoneX" : "no iphoneX")
        print(DYMobileMode.isIphoneXR ? "iphoneXR" : "no iphoneXR")
        print(DYMobileMode.isIphoneXS_Max ? "iphoneXS_Max" : "no iphoneXS_Max")
        
        print("设备类型：\(DYMobileMode.mobileMode)")
    }


}

