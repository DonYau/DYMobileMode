//
//  DYMobileMode.swift
//  DYMobileMode
//
//  Created by donyau on 2019/3/4.
//

import UIKit

let SimulatorName = "Simulator"

@objc public class DYMobileMode: NSObject {
    @objc public class var isIphonePlus:Bool {
        let deviceType = deviceModel()
        return deviceType.contains("Plus") || simulatorIphonePlus(deviceType: deviceType)
    }
    
    @objc public class var isIphoneX:Bool {
        let deviceType = deviceModel()
        return deviceType.contains("iPhone X") || simulatorIphoneX(deviceType: deviceType)
    }
    
    @objc public class var isIphoneXR:Bool {
        let deviceType = deviceModel()
        return deviceType.contains("iPhone XR") || simulatorIphoneXR(deviceType: deviceType)
    }
    
    @objc public class var isIphoneXS_Max:Bool {
        let deviceType = deviceModel()
        return deviceType.contains("iPhone XS Max") || simulatorIphoneXS_Mas(deviceType: deviceType)
    }
    
    @objc public class var mobileMode:String {
        return deviceModel();
    }
}

typealias DYMobileSimulator = DYMobileMode
private extension DYMobileSimulator {
    class func simulatorIphonePlus(deviceType:String) -> Bool {
        let iphonePlus = (UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: 1242, height: 2208).equalTo((UIScreen.main.currentMode?.size)!) : false)
        return deviceType.elementsEqual(SimulatorName) && iphonePlus
    }
    
    class func simulatorIphoneX(deviceType:String) -> Bool {
        let iphoneX = (UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: 1125, height: 2436).equalTo((UIScreen.main.currentMode?.size)!) : false)
        return deviceType.elementsEqual(SimulatorName) && (iphoneX || simulatorIphoneXR(deviceType: deviceType) || simulatorIphoneXS_Mas(deviceType: deviceType))
    }
    
    class func simulatorIphoneXR(deviceType:String) -> Bool {
        let iphoneXR = (UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: 828, height: 1792).equalTo((UIScreen.main.currentMode?.size)!) : false)
        return deviceType.elementsEqual(SimulatorName) && iphoneXR
    }
    
    class func simulatorIphoneXS_Mas(deviceType:String) -> Bool {
        let iphoneXS_Mas = (UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: 1242, height: 2688).equalTo((UIScreen.main.currentMode?.size)!) : false)
        return deviceType.elementsEqual(SimulatorName) && iphoneXS_Mas
    }
}


extension DYMobileMode {
    private class func deviceModel() -> String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        switch identifier {
        case "iPhone1,1":                               return "iPhone"
        case "iPhone1,2":                               return "iPhone 3G"
        case "iPhone2,1":                               return "iPhone 3GS"
        case "iPhone3,1", "iPhone3,2", "iPhone3,3":     return "iPhone 4"
        case "iPhone4,1":                               return "iPhone 4s"
        case "iPhone5,1", "iPhone5,2":                  return "iPhone 5"
        case "iPhone5,3", "iPhone5,4":                  return "iPhone 5c"
        case "iPhone6,1", "iPhone6,2":                  return "iPhone 5s"
        case "iPhone7,2":                               return "iPhone 6"
        case "iPhone7,1":                               return "iPhone 6 Plus"
        case "iPhone8,1":                               return "iPhone 6s"
        case "iPhone8,2":                               return "iPhone 6s Plus"
        case "iPhone8,4":                               return "iPhone SE"
        case "iPhone9,1","iPhone9,3":                   return "iPhone 7"
        case "iPhone9,2","iPhone9,4":                   return "iPhone 7 Plus"
        case "iPhone10,1","iPhone10,4":                 return "iPhone 8"
        case "iPhone10,2","iPhone10,5":                 return "iPhone 8 Plus"
        case "iPhone10,3","iPhone10,6":                 return "iPhone X"
        case "iPhone11,8":                              return "iPhone XR"
        case "iPhone11,2":                              return "iPhone XS"
        case "iPhone11,4","iPhone11,6":                 return "iPhone XS Max"
        case "iPad1,1":                                 return "iPad"
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":return "iPad 2"
        case "iPad3,1", "iPad3,2", "iPad3,3":           return "iPad (3rd generation)"
        case "iPad3,4", "iPad3,5", "iPad3,6":           return "iPad (4th generation)"
        case "iPad4,1", "iPad4,2", "iPad4,3":           return "iPad Air"
        case "iPad5,3", "iPad5,4":                      return "iPad Air 2"
        case "iPad6,7", "iPad6,8":                      return "iPad Pro (12.9-inch)"
        case "iPad6,3", "iPad6,4":                      return "iPad Pro (9.7-inch)"
        case "iPad6,11", "iPad6,12":                    return "iPad (5th generation)"
        case "iPad7,1", "iPad7,2":                      return "iPad Pro (12.9-inch) (2nd generation)"
        case "iPad7,3", "iPad7,4":                      return "iPad Pro (10.5-inch)"
        case "iPad7,5", "iPad7,6":                      return "iPad (6th generation)"
        case "iPad8,1", "iPad8,2","iPad8,3","iPad8,4":  return "iPad Pro (11-inch)"
        case "iPad8,5", "iPad8,6","iPad8,7","iPad8,8":  return "iPad Pro (12.9-inch) (3rd generation)"
        case "iPad2,5", "iPad2,6", "iPad2,7":           return "iPad Mini"
        case "iPad4,4", "iPad4,5", "iPad4,6":           return "iPad Mini 2"
        case "iPad4,7", "iPad4,8", "iPad4,9":           return "iPad Mini 3"
        case "iPad5,1", "iPad5,2":                      return "iPad Mini 4"
        case "i386", "x86_64":                          return SimulatorName
        default:                                        return "未识别：\(identifier)"
        }
    }
}
