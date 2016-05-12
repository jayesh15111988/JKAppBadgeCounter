//
//  JKMessageDetailsViewController.swift
//  JKAppBadgeCounter
//
//  Created by Jayesh Kawli Backup on 5/11/16.
//  Copyright © 2016 Jayesh Kawli Backup. All rights reserved.
//

import UIKit

class JKMessageDetailsViewController: UIViewController {

    let message: JKMessage?
    
    init(message: JKMessage) {
        self.message = message
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        self.view.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(label)
        self.title = message?.messageSubject
        label.text = message?.messageBody;
        
        let topLayoutGuide = self.topLayoutGuide
        let views: [String: AnyObject] = ["label": label, "topLayoutGuide": topLayoutGuide]
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-[label]-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[topLayoutGuide]-[label]-(>=0)-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views))
        
    }
}
