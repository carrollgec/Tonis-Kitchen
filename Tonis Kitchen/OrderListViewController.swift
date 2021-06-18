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
        
        orders.loadData {
            self.tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowOrder" {
            let destination = segue.destination as! OrderDetailViewController
            let selectedIndexPath = tableView.indexPathForSelectedRow!
            destination.order = orders.orderArray[selectedIndexPath.row]
        }
    }
    
    @IBAction func unwindFromSegue(segue: UIStoryboardSegue) {
        let source = segue.source as! OrderDetailViewController
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            orders.orderArray[selectedIndexPath.row] = source.order
            tableView.reloadRows(at: [selectedIndexPath], with: .automatic)
        } else {
            let newIndexPath = IndexPath(row: orders.orderArray.count, section: 0)
            orders.orderArray.append(source.order)
            print(orders.orderArray)
            tableView.insertRows(at: [newIndexPath], with: .bottom)
            orders.loadData {
                self.tableView.reloadData()
            }
        }
    }
}

extension OrderListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.orderArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = orders.orderArray[indexPath.row].notes
        return cell
    }
    
    
}
