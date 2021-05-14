//
//  OrderListViewController.swift
//  Tonis Kitchen
//
//  Created by Grace Carroll on 5/5/21.
//

import UIKit

class OrderListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var orders: Orders!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        orders = Orders()
        orders.populateOrders()
    }
    
}

extension OrderListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.orderArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = orders.orderArray[indexPath.row].timePickup
        return cell
    }
    
    
}
