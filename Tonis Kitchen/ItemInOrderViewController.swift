//
//  ItemInOrderViewController.swift
//  Tonis Kitchen
//
//  Created by Grace Carroll on 6/15/21.
//

import UIKit

class ItemInOrderViewController: UIViewController {

    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var ingredientsTextView: UITextView!
    @IBOutlet weak var allergensTextView: UITextView!
    @IBOutlet weak var quantityStepper: UIStepper!
    @IBOutlet weak var quantityLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        quantityLabel.text = "\(quantityStepper.value)"
    }
    
}
