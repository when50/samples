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
    var category: CategoryViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView .register(FlutterTableViewCell.self, forCellReuseIdentifier: flutterCellReuseIdentifier)
        tableView.separatorStyle = .none

        loadData()
    }
    
    private func loadData() {
//        let file = Bundle.main.path(forResource: "recommend", ofType: "json")!
//        do {
//            let text = try String(contentsOf: URL(fileURLWithPath: file))
//            let response = Response(JSONString: text)
//            self.response = response
//        } catch {
//
//        }
        
        let file = Bundle.main.path(forResource: "category", ofType: "json")!
        do {
            let text = try String(contentsOf: URL(fileURLWithPath: file))
            let response = CategoryViewModel(JSONString: text)
            self.category = response
        } catch {
            
        }
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        if response?.data?.count ?? 0 > 0 {
            return response?.data?.modules?.count ?? 0;
        }
        if category != nil {
            return 3
        }
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if response?.data?.count ?? 0 > 0 {
            guard let modules = response?.data?.modules else { return 0 }
            guard modules.count > section else { return 0 }
            return modules[section].data?.count ?? 0
        }
        if category != nil {
            switch section {
            case 0:
                return 1 // desc
            case 1:
                return category?.filters?.count ?? 0
            case 2:
                return category?.books?.count ?? 0
            default:
                return 0
            }
        }
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: flutterCellReuseIdentifier, for: indexPath)

        if let cell = cell as? FlutterTableViewCell {
            if cell.flutterView == nil {
                cell.flutterView = FlutterView(controller: self, viewIdentifier: "cell2")
            }
            cell.flutterView?.setFlutterCall({ [weak self] (method, arguments) in
                var message = ""
                
                switch method {
                case "clickView":
                    message = "click view";
                    break;
                case "clickComponent":
                    message = "click child at index \(arguments)";
                    break;
                default:
                    message = "flutter invoke \(method)";
                    break;
                }
                
                let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "ok", style: .default, handler: { (action) in
                    
                }))
                self?.present(alert, animated: true, completion: nil)
            })
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        guard let cell = cell as? FlutterTableViewCell else { return }
        if let modules = response?.data?.modules, modules.count > indexPath.section {
            if let cells = modules[indexPath.section].data, cells.count > indexPath.row {
                let cellModel = cells[indexPath.row];
                cell.flutterView?.update("\(cellModel.style ?? 10)", viewModel: cellModel.toJSON())
            }
        }
        
        if let category = category {
            switch indexPath.section {
            case 0:
                cell.flutterView?.update("categoryDesc", viewModel: category.desc ?? [:])
                break
            case 1:
                let vm = category.filters?[indexPath.row] ?? [:]
                cell.flutterView?.update("categoryFilter", viewModel: vm)
                break
            case 2:
                let vm = category.books?[indexPath.row] ?? [:]
                cell.flutterView?.update("categoryItem", viewModel: vm)
                break
            default:
                break
            }
        }
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        var height: CGFloat = 0
        
        if response != nil {
            guard let modules = response?.data?.modules else { return 0 }
            guard modules.count > indexPath.section else { return 0 }
            guard let cells = modules[indexPath.section].data, cells.count > indexPath.row else { return 0 }
            let cellModel = cells[indexPath.row]
            
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
        }
        
        if category != nil {
            switch indexPath.section {
            case 0:
                height = 54
            case 1:
                height = 38
            case 2:
                height = 129
            default:
                height = 0
            }
        }
        return height;
    }

}
