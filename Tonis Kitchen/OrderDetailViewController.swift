//
//  OrderDetailViewController.swift
//  Tonis Kitchen
//
//  Created by Grace Carroll on 5/4/21.
//

import UIKit

class OrderDetailViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var pickupTextField: UITextField!
    @IBOutlet weak var timeTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func selectItemButtonPressed(_ sender: UIButton) {
        //TODO: code selection button
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        //TODO: code cancel button
    }
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        //TODO: code save button
    }
    
}
