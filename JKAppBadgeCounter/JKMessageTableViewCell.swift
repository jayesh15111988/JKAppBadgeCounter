//
//  JKMessageTableViewCell.swift
//  JKAppBadgeCounter
//
//  Created by Jayesh Kawli Backup on 5/11/16.
//  Copyright © 2016 Jayesh Kawli Backup. All rights reserved.
//

import UIKit

class JKMessageTableViewCell: UITableViewCell {

    var messageSubjectLabel: UILabel
    var messageReadUnreadIcon: UIImageView
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        messageSubjectLabel = UILabel()
        messageSubjectLabel.translatesAutoresizingMaskIntoConstraints = false
        messageSubjectLabel.numberOfLines = 0
        messageReadUnreadIcon = UIImageView()
        messageReadUnreadIcon.translatesAutoresizingMaskIntoConstraints = false
        messageReadUnreadIcon.contentMode = UIViewContentMode.ScaleAspectFill
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        self.contentView.addSubview(messageSubjectLabel)
        self.contentView.addSubview(messageReadUnreadIcon)
        
        let views = ["messageSubjectLabel": messageSubjectLabel, "messageReadUnreadIcon": messageReadUnreadIcon]
        
        self.contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-[messageReadUnreadIcon(25)]-[messageSubjectLabel]-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views))
        self.contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-[messageSubjectLabel(>=20)]-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views))
        self.contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-[messageReadUnreadIcon(20)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
