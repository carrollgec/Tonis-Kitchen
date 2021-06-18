//
//  ItemInOrderViewController.swift
//  Tonis Kitchen
//
//  Created by Grace Carroll on 6/15/21.
//

import UIKit

class ItemInOrderViewController: UIViewController {

    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var ingredientsTextView: UITextView!
    @IBOutlet weak var allergensTextView: UITextView!
    @IBOutlet weak var quantityStepper: UIStepper!
    @IBOutlet weak var quantityLabel: UILabel!
    
    var menuItem: MenuItem!
    var itemOrderArray: [String] = [""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemNameLabel.text = menuItem.item
        descriptionTextView.text = menuItem.description
        ingredientsTextView.text = menuItem.ingredients
        allergensTextView.text = menuItem.allergyInfo
        quantityStepper.value = menuItem.quantity
        
    }
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        for index in 0...itemOrderArray.count - 1  {
            if itemOrderArray[index] == "" {
                itemOrderArray.remove(at: index)
            }
        }
    }
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        quantityLabel.text = "\(Int(quantityStepper.value))"
        
        if quantityStepper.value > menuItem.quantity {
            itemOrderArray.append(menuItem.item)
            menuItem.quantity = quantityStepper.value
        } else if quantityStepper.value < menuItem.quantity {
            itemOrderArray.remove(at: itemOrderArray.count-1)
            menuItem.quantity = quantityStepper.value
        } else {
            menuItem.quantity = quantityStepper.value
        }
    }
}
