import UIKit

extension UITextView {
    /**
     * 设置textview的占位符
     * 建议设置前，先设置UITextView的字体
     */
    var qch_placeholder: String? {
        set{
            if let lbl = self.value(forKey: "_placeholderLabel") as? UILabel {
                lbl.text = newValue
            }else if newValue != nil {
                let lbl = UILabel(text: newValue!, fontsize: font?.pointSize ?? 13.0, textColor: 0x666666.qch_color())
                lbl.numberOfLines = 0
                lbl.sizeToFit()
                addSubview(lbl)
                setValue(lbl, forKey: "_placeholderLabel")
            }
        }
        
        get{
            if let lbl = self.value(forKey: "_placeholderLabel") as? UILabel {
                return lbl.text
            }
            return nil
        }
        
    }
}
