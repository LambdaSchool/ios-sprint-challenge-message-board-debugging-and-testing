//
//  MessageThreadDetailTableViewController.swift
//  Message Board
//
//  Created by Spencer Curtis on 8/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class MessageThreadDetailTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = messageThread?.title
        addButton.accessibilityIdentifier = "MessageThreadDetailTableViewController.addButton"
        tableView.accessibilityIdentifier = "MessageThreadDetailTableViewController.tableView"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tableView.reloadData()
    }
    
    // MARK: - UITableViewDataSource

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageThread?.messages.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell", for: indexPath)

        let message = messageThread?.messages[indexPath.row]
        
        cell.textLabel?.text = message?.messageText
        cell.detailTextLabel?.text = message?.sender
        
        return cell
    }
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("tap on \(indexPath.row)")
//    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddMessage" {
            guard let destinationVC = segue.destination as? MessageDetailViewController else { return }
            
            destinationVC.messageThreadController = messageThreadController
            destinationVC.messageThread = messageThread
        }
//        if segue.identifier == "ShowMessageDetail" {
//            guard let destinationVC = segue.destination as? MessageDetailViewController, let indexPath = tableView.indexPathForSelectedRow else { return }
//            
//            destinationVC.messageThreadController = messageThreadController
//            destinationVC.messageThread = messageThread
//            destinationVC.message = messageThread?.messages[indexPath.row]
//        }
    }

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "AddMesage" {
//            guard let destinationVC = segue.destination as? MessageDetailViewController else { return }
//
//            destinationVC.messageThreadController = messageThreadController
//            destinationVC.messageThread = messageThread
//        }
//        if segue.identifier == "ShowMessageDetail" {
//            guard let destinationVC = segue.destination as? MessageDetailViewController, let indexPath = tableView.indexPathForSelectedRow else { return }
//
//            destinationVC.messageThreadController = messageThreadController
//            destinationVC.messageThread = messageThread
//            destinationVC.message = messageThread?.messages[indexPath.row]
//        }
//    }
    
    // MARK: - Properties
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    var messageThread: MessageThread?
    var messageThreadController: MessageThreadController?
}
