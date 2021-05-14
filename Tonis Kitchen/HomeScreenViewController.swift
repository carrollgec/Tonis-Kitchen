//
//  HomeScreenViewController.swift
//  Tonis Kitchen
//
//  Created by Grace Carroll on 5/4/21.
//

import UIKit

class HomeScreenViewController: UIViewController {
    
    @IBOutlet weak var selectionWeekTextField: UITextField!
    @IBOutlet weak var menuTableView: UITableView!
    
    var menuItems: MenuItems!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuItems = MenuItems()
        
        menuItems.populateMenu()
        
        menuTableView.delegate = self
        menuTableView.dataSource = self

    }
    //TODO: code prepare for segue to transfer menu item info to menu detail view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowMenu" {
            let destination = segue.destination as! MenuDetailViewController
            let selectedIndexPath = menuTableView.indexPathForSelectedRow!
            destination.menuItem = menuItems.menuItemArray[selectedIndexPath.row]
        }
    }
}

extension HomeScreenViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.menuItemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = menuItems.menuItemArray[indexPath.row].item
        return cell
    }
    
    
}
