//
//  HistoryViewController.swift
//  lifecounter
//
//  Created by Anthony Soeung on 2/4/26.
//


import UIKit

class HistoryViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var historyLog: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historyLog.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryCell", for: indexPath)
        cell.textLabel?.text = historyLog[indexPath.row]
        return cell
    }
}
