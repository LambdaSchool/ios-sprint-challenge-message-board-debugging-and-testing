//
//  MessageThreadDetailTableViewController.swift
//  Message Board
//
//  Created by Spencer Curtis on 8/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class MessageThreadDetailTableViewController: UITableViewController {
    
    // MARK: - Properties
    
    var messageThread: MessageThread?
    var messageThreadController: MessageThreadController?
    var message: MessageThread.Message?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = messageThread?.title
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
        updateViews()
    }
    
    // MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageThread?.messages.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell", for: indexPath)
        
        let message = messageThread?.messages[indexPath.row]
        
        cell.textLabel?.text = message?.text
        cell.detailTextLabel?.text = message?.sender
        
        return cell
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddMessage" {
            if let navController = segue.destination as? UINavigationController,
               let destinationVC = navController.viewControllers.first as? MessageDetailViewController {
                
                destinationVC.messageThreadController = messageThreadController
                destinationVC.messageThread = messageThread
                
            }
        }
    }
}

extension MessageThreadDetailTableViewController {
    private func updateViews() {
        
        //STRETCH GOALS
        
        
//        guard let messageThread = messageThread?.messages, let message = message else {return}
//
//        let text = message.text
//        let sender = message.sender
//
//        messageThreadController?.createMessage(in: messages, withText: text, sender: sender, completion: {
//            print("Message Saved")
//        })
    }
}
