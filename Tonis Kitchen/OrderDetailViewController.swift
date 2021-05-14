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
    
    var menuItems: MenuItems!
    var order: Order!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        order = Order()
        
        menuItems = MenuItems()
        menuItems.populateMenu()
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        let isPresentingInAddMode = presentingViewController is UINavigationController
        if isPresentingInAddMode {
            dismiss(animated: true, completion: nil)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        //TODO: code save button
    }
    
}

extension OrderDetailViewController: UITableViewDataSource, UITableViewDelegate, OrderTableViewCellDelegate {
    func selectionBoxToggle(sender: OrderTableViewCell) {
        if let selectedIndexPath = tableView.indexPath(for: sender) {
            menuItems.menuItemArray[selectedIndexPath.row].isSelected = !menuItems.menuItemArray[selectedIndexPath.row].isSelected
            tableView.reloadRows(at: [selectedIndexPath], with: .automatic)
            if menuItems.menuItemArray[selectedIndexPath.row].isSelected {
                order.itemOrderArray.insert(menuItems.menuItemArray[selectedIndexPath.row].item, at: selectedIndexPath.row)
            } else {
                order.itemOrderArray.remove(at: selectedIndexPath.row)
            }
        }
        print(order.itemOrderArray)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.menuItemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! OrderTableViewCell
        cell.delegate = self
        cell.itemNameLabel.text = menuItems.menuItemArray[indexPath.row].item
        cell.selectionButton.isSelected = menuItems.menuItemArray[indexPath.row].isSelected
        return cell
    }
}
