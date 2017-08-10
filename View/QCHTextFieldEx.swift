import UIKit

@IBDesignable
class QCHTextFieldEx: UITextField {
    
    enum PattrenFilter: String {
        case number = "[^0-9]"
        case alphabet = "[^a-zA-Z]"
        case lowerAlphabet = "[^a-z]"
        case upperAlphabet = "[^A-Z]"
        case numberAndAlphabet = "[^0-9a-zA-Z]"
        case wechat = "[^_\\-0-9a-zA-Z]"
        case chineseCharacter = "[^\\u4e00-\\u9fa5]"
    }
    
    
    //允许的最大长度: 0:无限制; other: 最大长度
    @IBInspectable
    var maxLength: Int = 0
    //过滤模式:正则表达式
    @IBInspectable
    var pattrenFilter : String = "" {
        didSet {
            if pattrenFilter != "" {
                patternMatcher = try? NSRegularExpression(pattern: pattrenFilter, options: .caseInsensitive)
            }else {
                patternMatcher = nil
            }
        }
    }
    
    //错误提示函数
    var funcShowTip: ((String) -> Void)?
    
    private var patternMatcher : NSRegularExpression?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addTarget(self, action: #selector(qch_textFieldDidChange(_:)), for: .editingChanged)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        addTarget(self, action: #selector(qch_textFieldDidChange(_:)), for: .editingChanged)
    }
    
    @objc private func qch_textFieldDidChange(_ tf : UITextField) {
        if tf.markedTextRange != nil {
            return
        }
        
        if patternMatcher != nil {
            var text = tf.text!
            text = patternMatcher!.stringByReplacingMatches(in: text, options: .reportCompletion, range: NSMakeRange(0, text.characters.count), withTemplate: "")
            
            if tf.text! != text {
                tf.text = text
            }
        }
        
        if maxLength > 0 {
            if tf.text!.characters.count > maxLength {
                tf.text = tf.text?.substring(to: tf.text!.index(tf.text!.startIndex, offsetBy: maxLength))
                funcShowTip?("内容超过最大允许长度\(maxLength)")
            }
        }
    }
}
