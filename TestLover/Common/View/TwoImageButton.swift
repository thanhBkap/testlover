//
//  TwoImageButton.swift
//  TestLover
//
//  Created by nguyenthanh on 9/19/19.
//  Copyright © 2019 storm. All rights reserved.
//

import UIKit

@IBDesignable
class TwoImageButton: UIButton {
    
    @IBInspectable var leftHandImage: UIImage? {
        didSet {
            leftHandImage = leftHandImage?.withRenderingMode(.alwaysOriginal)
            setupImages()
        }
    }
    @IBInspectable var rightHandImage: UIImage? {
        didSet {
            rightHandImage = rightHandImage?.withRenderingMode(.alwaysTemplate)
            setupImages()
        }
    }
    
    @IBInspectable var leftHandLabel: String? {
        didSet {
            setupLabels()
        }
    }
    
    @IBInspectable var rightHandLabel: String? {
        didSet {
            setupLabels()
        }
    }

    func setupImages() {
        if let leftImage = leftHandImage {
//            self.setImage(leftImage, for: .normal)
//            self.imageView?.contentMode = .scaleAspectFill
//            self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: self.frame.width - (self.imageView?.frame.width)!)
            let leftImageView = UIImageView(image: leftImage)
            leftImageView.tintColor = UIColor.red

            let height = self.frame.height * 0.5
            let width = height
            let xPos = 25
            let yPos = (self.frame.height - height) / 2
            
            leftImageView.frame = CGRect(x: CGFloat(xPos), y: yPos, width: width, height: height)
            self.addSubview(leftImageView)
            self.titleEdgeInsets.left = 50 + width
        }
        
        if let rightImage = rightHandImage {
            let rightImageView = UIImageView(image: rightImage)
            rightImageView.tintColor = UIColor.red
            
            let height = self.frame.height * 0.3
            let width = height
            let xPos = self.frame.width - width - 25
            let yPos = (self.frame.height - height) / 2
            
            rightImageView.frame = CGRect(x: xPos, y: yPos, width: width, height: height)
            self.addSubview(rightImageView)
        }
    }
    
    func setupLabels() {
        
        if let leftLabelText = leftHandLabel {
            let leftLabel = UILabel()
            leftLabel.text = leftLabelText
            leftLabel.textAlignment = .left
            
            let height = self.frame.height * 0.5
            let width = CGFloat(200)
            let xPos = height
            let yPos = (self.frame.height - height) / 2
            leftLabel.frame = CGRect(x: CGFloat(xPos), y: yPos, width: 200, height: height)
            
            self.addSubview(leftLabel)
        }
        
        if let rightLabelText = rightHandLabel {
            let rightLabel = UILabel()
            rightLabel.text = rightLabelText
            rightLabel.textAlignment = .right
            
            let height = self.frame.height * 0.5
            let width = CGFloat(200)
            let xPos = self.frame.width - width - height
            let yPos = (self.frame.height - height) / 2
            rightLabel.frame = CGRect(x: CGFloat(xPos), y: yPos, width: 200, height: height)
            
            self.addSubview(rightLabel)
        }
    }
}
