import UIKit

extension UIApplication {
    static var qch_version: String {
        get {
            return (Bundle.main.infoDictionary!["CFBundleShortVersionString"])! as! String
        }
    }
    
    static var qch_bundleId: String {
        get {
            return (Bundle.main.infoDictionary!["CFBundleIdentifier"])! as! String
        }
    }
    
    static var qch_appName: String {
        get {
            return (Bundle.main.infoDictionary!["CFBundleName"])! as! String
        }
    }
    
    static var qch_appDisplayName: String {
        get {
            return ((Bundle.main.infoDictionary!["CFBundleDisplayName"])! as? String) ?? UIApplication.qch_appName
        }
    }
}
