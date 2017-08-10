//
//  UIImage+qch.swift
//

import UIKit

extension UIImage {
    /**
     * 返回一个指定高度，一像素款宽的指定颜色的图片
     */
    static func qch_imageWithColor( color : UIColor, height : CGFloat) -> UIImage{
        let rect = CGRect(x: 0, y: 0, width: 1.0, height: height)
        UIGraphicsBeginImageContext(rect.size)
        let content = UIGraphicsGetCurrentContext()
        content?.setFillColor(color.cgColor)
        content?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    /**
     * 返回指定宽度的图片。图片宽高比和原图片相同,图片最小高度为1
     * width: 目标图片宽度; <=0 返回图片自身
     */
    func qch_resizeToWidth( width : CGFloat = 800) -> UIImage? {
        return autoreleasepool(invoking: { () -> UIImage? in
            if width <= 0 {
                return self
            }
            
//            if self.size.width <= width {
//                return self
//            }
            
            let newSize = CGSize(width: width, height: ceil(size.height * width / size.width) )
            UIGraphicsBeginImageContext(newSize)
            self.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
            let newImage = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            return newImage
        })
    }


}
