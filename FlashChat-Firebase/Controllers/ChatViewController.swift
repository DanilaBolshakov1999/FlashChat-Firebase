//
//  LoginViewController.swift
//  Flash Chat iOS13
//
//  Created by Danila Bolshakov on 21/10/2019.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

final class ChatViewController: UIViewController {
    
    private let message = [
        Message(sender: "1@2.com", body: "Hey!"),
        Message(sender: "a@b.com", body: "Hello"),
        Message(sender: "1@2.com", body: "What's app?")
    ]

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        title = K.appName
        navigationItem.hidesBackButton = true
        
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        if let messageBody = messageTextfield.text, let messageSender = Auth.auth().currentUser?.email {
            db.collection(K.FStore.collectionName).addDocument(data: [
                K.FStore.senderField: messageBody,
                K.FStore.dateField: messageSender
            ]) { (error) in
                if let error = error {
                    print("There was an issue saving data of firestore, \(error)")
                } else {
                    print("Successfully saved data!")
                }
            }
        }
    }
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        do {
          try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
    }
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        message.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as? MessageCell else { return UITableViewCell() }
        let person = message[indexPath.row]
        cell.textLabel?.text = person.body
        return cell
    }
    
    

}
