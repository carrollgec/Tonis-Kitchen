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
    @IBOutlet weak var metricLabel: UILabel!
    
    
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
        metricLabel.text = String(menuItem.metric)
        switch menuItem.item {
        case "Apple":
            imageView.image = UIImage(named: "apple")
        case "Pasta":
            imageView.image = UIImage(named: "rotini")
        case "Fresh Bread":
            imageView.image = UIImage(named: "freshbread")
        case "Eggplant Parmesean (Frozen Meal)":
            imageView.image = UIImage(named: "eggplantparm")
        default:
            imageView.image = UIImage()
        }
    }

}
