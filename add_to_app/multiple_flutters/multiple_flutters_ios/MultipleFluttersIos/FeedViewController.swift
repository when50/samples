//
//  FeedViewController.swift
//  MultipleFluttersIos
//
//  Created by oneko on 2021/6/1.
//

import UIKit
import ObjectMapper

class FeedViewController: UITableViewController {
    let flutterCellReuseIdentifier = "FlutterTableViewCell"
    var response: Response?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView .register(FlutterTableViewCell.self, forCellReuseIdentifier: flutterCellReuseIdentifier)

        loadData()
    }
    
    private func loadData() {
        let file = Bundle.main.path(forResource: "recommend", ofType: "json")!
        do {
            let text = try String(contentsOf: URL(fileURLWithPath: file))
            let response = Response(JSONString: text)
            self.response = response
        } catch {
            
        }
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return response?.data?.modules?.count ?? 0;
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        guard let modules = response?.data?.modules else { return 0 }
        guard modules.count > section else { return 0 }
        return modules[section].data?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: flutterCellReuseIdentifier, for: indexPath)

        if let cell = cell as? FlutterTableViewCell {
            if cell.flutterView == nil {
                cell.flutterView = FlutterView(controller: self, viewIdentifier: "cell2")
            }
            cell.flutterView?.setFlutterCall({ (method, arguments) in
                print("flutter invokeXXX \(method)")
            })
            
            if let modules = response?.data?.modules, modules.count > indexPath.section {
                if let cells = modules[indexPath.section].data, cells.count > indexPath.row {
                    let cellModel = cells[indexPath.row];
                    cell.flutterView?.update("\(cellModel.style ?? 10)", viewModel: cellModel.toJSON())
                }
            }
        }

        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let modules = response?.data?.modules else { return 0 }
        guard modules.count > indexPath.section else { return 0 }
        guard let cells = modules[indexPath.section].data, cells.count > indexPath.row else { return 0 }
        let cellModel = cells[indexPath.row]
        
        var height: CGFloat = 0
        if let style = cellModel.style {
            switch style {
            case 10:
                height = 234;
                break;
            case 9:
                height = 115;
                break;
            default:
                break;
            }
        }
        return height;
    }

}
