//
//  MessageDetailViewController.swift
//  Message Board
//
//  Created by Spencer Curtis on 8/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class MessageDetailViewController: UIViewController {
    
    // MARK: - Properties
    
    var messageThreadController: MessageThreadController?
    var messageThread: MessageThread?

    @IBOutlet weak var senderNameTextField: UITextField!
    @IBOutlet weak var messageTextView: UITextView!

    // MARK: - Actions
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendMessage(_ sender: Any) {
        guard let senderName = senderNameTextField.text,
            let messageText = messageTextView.text,
            let messageThread = messageThread else { return }
        
        messageThreadController?.createMessage(in: messageThread, withText: messageText, sender: senderName, completion: {
            print("Message created!")
        })
          navigationController?.dismiss(animated: true, completion: nil)
    }
}
