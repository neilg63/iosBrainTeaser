//
//  Card.swift
//  BrainTeaser
//
//  Created by Neil Gardner on 08/04/2016.
//  Copyright © 2016 Neil Gardner. All rights reserved.
//

import UIKit

class Card: UIView {

    let shapes = ["buildings","butterfly","tree","geo-shape-2","geo-shape-3","geo-shape-4","geo-shape-5"]
    
    var currentShape: String!
    
    @IBOutlet weak var shapeImage: UIImageView!
    
    @IBInspectable var cornerRadius: CGFloat = 3.0 {
        didSet {
            setupView()
        }
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
    
    
    override func awakeFromNib() {
        setupView()
        selectShape()
    }
    
    func setupView() {
        self.layer.shadowOpacity = 0.8
        self.layer.cornerRadius = cornerRadius
        self.layer.shadowRadius = 5.0
        self.layer.shadowOffset = CGSizeMake(0.0, 0.2)
        self.layer.shadowColor = UIColor(red: 157.0/255.0, green: 157.0/255, blue: 157.0/255.0, alpha: 1.0).CGColor
        self.setNeedsLayout()
    }
    
    func selectShape() {
        currentShape = shapes[Int(arc4random_uniform(UInt32(self.shapes.count)))]
        shapeImage.image = UIImage(named: currentShape)
    }
    
}
