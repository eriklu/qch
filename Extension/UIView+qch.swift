import UIKit

extension UIView {
    
    static var qch_screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    static var qch_screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    
    /**
    * 设置视图圆角
    */
    func qch_setCornerRadius(radius: CGFloat) {
        guard radius > 0 else {
            return
        }
        
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    
    /**
    * 垂直方向上安排子视图
    *
    */
    func qch_stackArraySubviews(lstView: [UIView], edgeInset: UIEdgeInsets, space: CGFloat) {
        //TODO :
    }
}
