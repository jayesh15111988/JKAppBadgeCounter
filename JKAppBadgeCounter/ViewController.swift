//
//  ViewController.swift
//  JKAppBadgeCounter
//
//  Created by Jayesh Kawli Backup on 5/10/16.
//  Copyright © 2016 Jayesh Kawli Backup. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var messages: [JKMessage] = []
    var readMessagesCollection: [String] = []
    var tableView: UITableView!
    var numberOfUnreadMessage: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Inbox Messages"
        self.automaticallyAdjustsScrollViewInsets = false
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 44.0
        
        tableView.registerClass(JKMessageTableViewCell.self, forCellReuseIdentifier: "cellIdentifier")
        self.view.addSubview(tableView)
        let topLayoutGuide = self.topLayoutGuide
        let views: [String: AnyObject] = ["tableView": tableView, "topLayoutGuide": topLayoutGuide]
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[tableView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[topLayoutGuide][tableView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views))
        
        messages = [JKMessage(messageId: "100", messageSubject: "Microsoft", messageBody: "This is so garbage and bureaucratic company"),
                    JKMessage(messageId: "101", messageSubject: "Google", messageBody: "This is a giant company which makes search engines"),
                    JKMessage(messageId: "102", messageSubject: "Facebook", messageBody: "This is social networking website"),
                    JKMessage(messageId: "103", messageSubject: "Amazon", messageBody: "Online market nd retail store company by jeff bezos"),
                    JKMessage(messageId: "104", messageSubject: "eBay", messageBody: "Online auction company. Full of garbage and sub-standard product")]
        numberOfUnreadMessage = messages.count
        incrementBadgeNumberBy(numberOfUnreadMessage)
        tableView .reloadData()
    }
    
    // MARK: Data soure and delegate methods
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let message = messages[indexPath.row];
        let cell = tableView.dequeueReusableCellWithIdentifier("cellIdentifier", forIndexPath: indexPath) as! JKMessageTableViewCell        
        cell.messageSubjectLabel.text = message.messageSubject
        cell.messageReadUnreadIcon.image = UIImage(named: "unread")
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath) as! JKMessageTableViewCell
        cell.messageReadUnreadIcon.image = UIImage(named: "read")
        let message = messages[indexPath.row]
        if (readMessagesCollection.contains(message.messageId) == false) {
            readMessagesCollection.append(message.messageId)
            incrementBadgeNumberBy(-1)
        }
        let messageDetailsViewController = JKMessageDetailsViewController(message: message)
        self.navigationController?.pushViewController(messageDetailsViewController, animated: true)
    }
    
    func incrementBadgeNumberBy(badgeNumberIncrement: Int) {
        let currentBadgeNumber = UIApplication.sharedApplication().applicationIconBadgeNumber
        let updatedBadgeNumber = currentBadgeNumber + badgeNumberIncrement
        if (updatedBadgeNumber > -1) {
            UIApplication.sharedApplication().applicationIconBadgeNumber = updatedBadgeNumber
        }
    }

}

