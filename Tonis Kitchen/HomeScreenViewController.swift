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
    
    var menuItemArray = ["Apples", "Frozen Meals", "Bread", "Peanut Butter"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuTableView.delegate = self
        menuTableView.dataSource = self

    }
}

extension HomeScreenViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = menuItemArray[indexPath.row]
        return cell
    }
    
    
}
