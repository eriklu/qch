import UIKit

extension UILabel {
    func qch_fitWidth(maxWidth: CGFloat = 0) -> CGFloat {
        let size = CGSize(width: maxWidth > 0 ? maxWidth : UIScreen.main.bounds.width, height: font.pointSize + 2)
        return ceil((text! as NSString).boundingRect(with: size, options: [], attributes: [NSFontAttributeName : font], context: nil).size.width)
    }
    
    convenience init(text : String, fontsize : CGFloat = 12.0, textColor : UIColor = 0x666666.qch_color()) {
        self.init()
        self.text = text
        self.font = UIFont.systemFont(ofSize: fontsize)
        self.textColor = textColor
    }
}
