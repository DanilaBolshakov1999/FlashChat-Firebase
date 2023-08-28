//
//  MessegeCell.swift
//  FlashChat-Firebase
//
//  Created by iOS - Developer on 25.08.2023.
//

import UIKit

class MessageCell: UITableViewCell {
    
    @IBOutlet var messageBubble: UIView!
    @IBOutlet var label: UILabel!
    @IBOutlet var rightImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        messageBubble.layer.cornerRadius = messageBubble.frame.size.height / 5
    }
}
