//
//  Int+qch.swift
//
//

import UIKit

extension Int {
    /**
    * 整数转换为颜色。高两位字节为0:表示不透明；高两位字节不为0：解释为alpha值
    */
    func qch_color() -> UIColor {
        let alpha = ((self >> 24) == 0) ? 1.0 : (CGFloat(self >> 24) / 255.0)
        return UIColor(red: CGFloat((self >> 16) & 0xFF) / 255.0 , green: CGFloat((self >> 8) & 0xFF) / 255.0, blue: CGFloat(self & 0xFF) / 255.0, alpha: alpha)
    }
    
    
//    /**
//    * 转换为中文数字字符串
//    *
//    */
//    func toChinaNumString()-> String{
//
//        if self == 0 {
//            return "零"
//        }
//        
//        if self < 0 {
//            return "负" + (-self).toChinaBigNumString()
//        }
//        
//        let lstNum = ["", "一", "二", "三", "四", "五", "六", "七", "八", "九"]
//        let num = self
//        if num >= 100 {
//            return ""
//        }
//        
//        //var ret = ""
//        
//        if num < 10 {
//            return lstNum[num]
//        }
//        
//        if num  == 10 {
//            return "十"
//        }
//        
//        if num < 20 {
//            return "十\(lstNum[num % 10])"
//        }
//        
//        if num % 10 == 0 {
//            return "\(lstNum[num / 10])十"
//        }
//        
//        return "\(lstNum[num / 10])十\(lstNum[num % 10])"
//    }
//    
//    private static func _toChinaBigNumString(value: Int) {
//        guard value < 10000 else {
//            finalError()
//        }
//        
//        var ret = ""
//        
//        
//    }

}
