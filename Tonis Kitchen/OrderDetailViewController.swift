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
    @IBOutlet weak var timeTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var notesTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var menuItems: MenuItems!
    var order: Order!
    var orders: Orders!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateInterface()
        
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        if order == nil {
            order = Order()
        } else {
            saveButton.isEnabled = false
            nameTextField.isEnabled = false
            addressTextField.isEnabled = false
            phoneTextField.isEnabled = false
            timeTextField.isEnabled = false
            notesTextField.isEnabled = false
            tableView.allowsSelection = false
        }
        
        menuItems = MenuItems()
        orders = Orders()
        
        menuItems.populateMenu()
    
        let isPresentingInAddMode = presentingViewController is UINavigationController
        if !isPresentingInAddMode {
            saveButton.isEnabled = false
        }
    }
    
    func updateInterface() {
        let isPresentingInAddMode = presentingViewController is UINavigationController
        if !isPresentingInAddMode {
            nameTextField.text = order.name
            addressTextField.text = order.emailAddress
            phoneTextField.text = order.phoneNumber
            timeTextField.text = order.pickup
            notesTextField.text = order.notes
        }
    }
    
    func updateFromInterface() {
        order.name = nameTextField.text ?? ""
        order.emailAddress = addressTextField.text ?? ""
        order.phoneNumber = phoneTextField.text ?? ""
        order.pickup = timeTextField.text ?? ""
        order.notes = notesTextField.text ?? ""
    }
    
    func leaveViewController() {
        let isPresentingInAddMode = presentingViewController is UINavigationController
        if isPresentingInAddMode {
            dismiss(animated: true, completion: nil)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddItems" {
            let destination = segue.destination as! ItemInOrderViewController
            let selectedIndexPath = tableView.indexPathForSelectedRow!
            destination.menuItem = menuItems.menuItemArray[selectedIndexPath.row]
        }else {
            updateFromInterface()
            order.saveData { success in
                print("Success saving Data")
            }
        }
    }
    
    @IBAction func unwindFromItem(segue: UIStoryboardSegue) {
        let source = segue.source as! ItemInOrderViewController
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            menuItems.menuItemArray[selectedIndexPath.row].quantity = source.quantityStepper.value
            tableView.reloadRows(at: [selectedIndexPath], with: .automatic)
        }
        order.itemOrderArray += source.itemOrderArray
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        leaveViewController()
    }
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        updateFromInterface()
//        for index in 0..<menuItems.menuItemArray.count {
//            if menuItems.menuItemArray[index].isSelected {
//                order.itemOrderArray.append(menuItems.menuItemArray[index].item)
//            }
//        }
        for index in 0...order.itemOrderArray.count - 1  {
            if order.itemOrderArray[index] == "" {
                order.itemOrderArray.remove(at: index)
            }
        }
        order.saveData { success in
            if success {
                print("Success saving new order")
            }
        }
        leaveViewController()
    }
    
}

extension OrderDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.menuItemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = menuItems.menuItemArray[indexPath.row].item
        cell.detailTextLabel?.text = "Quantity Selected: \(Int(menuItems.menuItemArray[indexPath.row].quantity))"
        return cell
    }
}
