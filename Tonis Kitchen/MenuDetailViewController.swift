//
//  MenuDetailViewController.swift
//  Tonis Kitchen
//
//  Created by Grace Carroll on 5/4/21.
//

import UIKit

class MenuDetailViewController: UIViewController {
    
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var allergensTextView: UITextView!
    @IBOutlet weak var ingredientsTextView: UITextView!
    @IBOutlet weak var quantityLabel: UILabel!
    
    
    var menuItem: MenuItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        updateInterface()
    }
    
    func updateInterface() {
        foodNameLabel.text = menuItem.item
        descriptionTextView.text = menuItem.description
        allergensTextView.text = menuItem.allergyInfo
        ingredientsTextView.text = menuItem.ingredients
        quantityLabel.text = String(menuItem.quantity)
    }

}
