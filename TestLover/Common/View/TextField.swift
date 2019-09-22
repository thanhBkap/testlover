//
//  TextField.swift
//  TestLover
//
//  Created by nguyenthanh on 9/22/19.
//  Copyright © 2019 storm. All rights reserved.
//
import UIKit

class TextField: UITextField {
    
    let padding = UIEdgeInsets(top: 25, left: 5, bottom: 25, right: 5)
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
}
