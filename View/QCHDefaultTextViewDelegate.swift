import UIKit

class QCHDefaultTextViewDelegate : NSObject, UITextViewDelegate {
    //按回车键退出编辑状态
    var isResignFirstResponderOnReturn: Bool = true
    //是否允许输入emoji
    var isAllowEmoji: Bool = false
    
    //最大允许长度. <=0:无限制;其他：允许最大长度
    var maxLength: Int = 0
    
    //错误提示函数
    var funcShowTip: ((String) -> Void)?
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        //        if textView.markedTextRange != nil {
        //            return true
        //        }
        
        if isResignFirstResponderOnReturn && text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        
        if !isAllowEmoji && text.qch_containsEmoji {
            return false
        }
        
        return true
    }
    
    
    func textViewDidChange(_ textView: UITextView) {
        if textView.markedTextRange != nil {
            return
        }
        
        if maxLength > 0 {
            let text = textView.text!
            if text.characters.count > maxLength {
                textView.text = text.substring(to: text.index(text.startIndex, offsetBy: maxLength))
                funcShowTip?("内容超过最大允许长度\(maxLength)")
            }
        }
    }
}

