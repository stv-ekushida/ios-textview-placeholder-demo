//
//  TextView+Placeholder.swift
//  ios-textview-placeholder-demo
//
//  Created by Eiji Kushida on 2017/06/22.
//  Copyright © 2017年 Eiji Kushida. All rights reserved.
//

import UIKit

extension UITextView: UITextViewDelegate {

    @IBInspectable var placeholder: String? {

        get {
            var placeholderText: String?

            if let placeHolderLabel = self.viewWithTag(100) as? UILabel {
                placeholderText = placeHolderLabel.text
            }
            return placeholderText
        }

        set {
            let placeHolderLabel = self.viewWithTag(100) as! UILabel?
            if placeHolderLabel == nil {
                self.addPlaceholderLabel(placeholderText: newValue!)
            }
            else {
                placeHolderLabel?.text = newValue
                placeHolderLabel?.sizeToFit()
            }
        }
    }

    private func addPlaceholderLabel(placeholderText: String) {

        let placeholderLabel = UILabel()
        placeholderLabel.text = placeholderText
        placeholderLabel.sizeToFit()
        placeholderLabel.frame.origin.x = 5.0
        placeholderLabel.frame.origin.y = 5.0
        placeholderLabel.font = self.font
        placeholderLabel.textColor = UIColor.lightGray
        placeholderLabel.tag = 100

        placeholderLabel.isHidden = (self.text.characters.count > 0)

        self.addSubview(placeholderLabel)
        self.delegate = self;
    }

    //MARK:- UITextViewDelegate
    public func textViewDidChange(_ textView: UITextView) {
        let placeHolderLabel = self.viewWithTag(100)
        placeHolderLabel?.isHidden = self.hasText
    }
}

