//
//  ColorfulTableViewController.swift
//  11.ColorfulTableView
//
//  Created by 倩倩 on 2018/10/9.
//  Copyright © 2018年 Swifter. All rights reserved.
//

import UIKit

class ColorfulTableViewController: UITableViewController {

    let dataArray = ["viewDidLoad",
                     "numberOfSections",
                     "Table view data source",
                     "#warning Incomplete implementation, return the number of sections",
                     "class ColorfulTableViewController: UITableViewController",
                     "Copyright © 2018年 Swifter. All rights reserved.",
                     "Created by 倩倩 on 2018/10/9.",
                     "func tableView(_ tableView: ",
                     "#warning Incomplete implementation, return the number of rows",
                     "let cell = tableView.dequeueReusableCell(withIdentifier: for:",
                     "Configure the cell...",
                     "to support conditional editing of the table view.",
                     "Delete the row from the data source",
                     "Table view data source",
                     "Delete the row from the data source",
                     "to support conditional editing of the table view."]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "tableCell")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)

        cell.textLabel?.text = dataArray[indexPath.row]
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.backgroundColor = UIColor.clear
        cell.textLabel?.font = UIFont(name: "Avenir Next", size: 18)
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = colorForCellWithIndex(index: indexPath.row)
    }
    
    // MARK: - Custom Method
    func colorForCellWithIndex(index: Int) -> UIColor {
        let itemCount = dataArray.count - 1
        let greenColor = (CGFloat(index) / CGFloat(itemCount))
        return UIColor(red: 1.0, green: greenColor, blue: 0.0, alpha: 1.0)
    }
}
