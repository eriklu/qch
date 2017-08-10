import UIKit

class QCHDefaultTextFieldDelegate : NSObject, UITextFieldDelegate {
    //是否允许输入emoji
    var isAllowEmoji: Bool = false
    //是否允许编辑判断函数
    var funcTextFieldShouldBeginEditing: ((UITextField) -> Bool)?
    
    //错误提示函数
    var funcShowTip: ((String) -> Void)?
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return funcTextFieldShouldBeginEditing?(textField) ?? true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        //        if textField.markedTextRange != nil {
        //            return true
        //        }
        
        if !isAllowEmoji && string.qch_containsEmoji {
            funcShowTip?("不支持表情符号")
            return false
        }
        
        return true
    }
    
}
