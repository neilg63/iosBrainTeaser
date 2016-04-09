//
//  ViewController.swift
//  BrainTeaser
//
//  Created by Neil Gardner on 06/04/2016.
//  Copyright © 2016 Neil Gardner. All rights reserved.
//

import UIKit
import pop

class LoginVC: UIViewController {

    @IBOutlet weak var emailCenter: NSLayoutConstraint!

    @IBOutlet weak var passwordCenter: NSLayoutConstraint!
    
    @IBOutlet weak var loginCenter: NSLayoutConstraint!
    
    var animEngine: AnimationEngine!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.animEngine = AnimationEngine(constraints: [emailCenter,passwordCenter,loginCenter])
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        self.animEngine.animateOnScreen(1)
    }


}

