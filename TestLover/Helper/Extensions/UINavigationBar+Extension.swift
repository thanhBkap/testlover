//
//  UINavigationBar+Extension.swift
//  TestLover
//
//  Created by nguyenthanh on 9/19/19.
//  Copyright © 2019 storm. All rights reserved.
//
import UIKit

extension UINavigationBar {
    func clear() {
        shadowImage = UIImage()
        setBackgroundImage(UIImage(), for: .default)
        backgroundColor = .clear
    }
}
