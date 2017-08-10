import UIKit

infix operator =~ : qch
precedencegroup qch {
    associativity: none
    higherThan: AdditionPrecedence
    lowerThan: MultiplicationPrecedence
}


func =~(lhs: String, rhs: String) -> Bool {
    do {
        return try String.RegexHelper(rhs).match(input: lhs)
    } catch _ {
        return false
    }
}


extension String {
    
    //校验是否含有emoji表情
    var qch_containsEmoji:Bool {
        // http://stackoverflow.com/questions/30757193/find-out-if-character-in-string-is-emoji
        for scalar in unicodeScalars {
            switch scalar.value {
            case 0x3030, 0x00AE, 0x00A9, // Special Characters
            0x1D000...0x1F77F, // Emoticons
            0x2100...0x27BF, // Misc symbols and Dingbats
            0xFE00...0xFE0F, // Variation Selectors
            0x1F900...0x1F9FF: // Supplemental Symbols and Pictographs
                return true
            default:
                continue
            }
        }
        return false
    }
    
    //字符串字符个数
    var qch_length: Int {
        get {
            return self.characters.count
        }
    }
    
    //校验是否为金额
    func qch_isMoney() -> Bool {
        return self =~ "^[0-9]+(\\.[0-9]{1,2})?$"
    }
    

    var qch_isWechatId : Bool {
        get {
            return self =~ "^[0-9a-zA-Z_\\-]{6,21}$"
        }
    }
    
    /**
    * 返回子字符串
    * to: 返回(0..<to)
    * to < 0: 返回空字符串
    * to > length: 返回字符串本身
    */
    func qch_substring(to : Int) -> String {
        
        guard to >= 0 else {
            return ""
        }
        
        
        guard self.characters.count > to else{
            return ""
        }
        
        return self.substring(to: self.index(self.startIndex, offsetBy: to))
    }
    
    /**
     * 返回子字符串
     * from: 返回(from..<length)
     * from < 0 || from > length: 返回空字符串
     *
     */
    func qch_substring(from : Int) -> String {
        
        guard from >= 0 else {
            return ""
        }
        
        guard self.characters.count > from else{
            return ""
        }
        
        
        return self.substring(from: self.index(self.startIndex, offsetBy: from))
    }

    
    struct RegexHelper {
        let regex: NSRegularExpression
        
        init(_ pattern: String) throws {
            try regex = NSRegularExpression(pattern: pattern,
                                            options: .caseInsensitive)
        }
        
        func match(input: String) -> Bool {
            let matches = regex.matches(in: input,
                                        options: [],
                                        range: NSMakeRange(0, input.characters.count))
            return matches.count > 0
        }
    }
}
