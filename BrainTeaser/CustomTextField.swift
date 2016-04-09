//
//  CustomTextField.swift
//  BrainTeaser
//
//  Created by Neil Gardner on 06/04/2016.
//  Copyright © 2016 Neil Gardner. All rights reserved.
//

import UIKit


class CustomTextField: UITextField {
    
    @IBInspectable var inset: CGFloat = 3.0
    
    @IBInspectable var cornerRadius: CGFloat = 5.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    override func textRectForBounds(bounds: CGRect) -> CGRect {
        return CGRectInset(bounds,inset,inset)
    }
    
    override func editingRectForBounds(bounds: CGRect) -> CGRect {
        return textRectForBounds(bounds)
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
    
    func setupView() {
        self.layer.cornerRadius = cornerRadius
    }
    
}
