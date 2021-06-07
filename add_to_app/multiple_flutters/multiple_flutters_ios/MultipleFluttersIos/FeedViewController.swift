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
                    cell.flutterView?.update("\(cellModel.style)", viewModel: NSObject())
                }
            }
        }

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
