//
//  OrderTableViewCell.swift
//  Tonis Kitchen
//
//  Created by Grace Carroll on 5/13/21.
//

import UIKit

protocol OrderTableViewCellDelegate: AnyObject {
    func selectionBoxToggle(sender: OrderTableViewCell)
}

class OrderTableViewCell: UITableViewCell {
    
    weak var delegate: OrderTableViewCellDelegate?

    @IBOutlet weak var selectionButton: UIButton!
    @IBOutlet weak var itemNameLabel: UILabel!
    
    
    @IBAction func selectionBoxToggle(_ sender: UIButton) {
        delegate?.selectionBoxToggle(sender: self)
    }
}
