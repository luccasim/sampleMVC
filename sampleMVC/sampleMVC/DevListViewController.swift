//
//  ViewController.swift
//  sampleMVC
//
//  Created by Luc Casimir on 26/06/2017.
//  Copyright © 2017 Luc Casimir. All rights reserved.
//

import UIKit

class DevListViewController: UIViewController {

//MARK: Outlets

    @IBOutlet weak var tableView: UITableView!{
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
//MARK: Properties
    
    var devDataManager = DevDataManager()
    
//MARK: ViewController LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

//MARK: Navigation
    
    /// Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else {
            print(segue)
            return ;
        }
        switch identifier {
        case "editSegue":
            if let dvc = segue.destination as? DevEditViewController,
                let data = sender as? Dev {
                dvc.data = data
            }
        default:
            break
        }
    }
    
    /// unwind
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue, sender: Any?) {
        tableView.reloadData()
    }
}

//MARK: TableView

extension DevListViewController : UITableViewDelegate {
    
    /// Touching Row
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "editSegue", sender: devDataManager.devs[indexPath.row])
    }
}

extension DevListViewController : UITableViewDataSource {

    /// Delete Row
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            devDataManager.delete(Dev: devDataManager.devs[indexPath.row])
            tableView.reloadData()
        }
    }
    
    /// Number Rows
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return devDataManager.devs.count
    }
    
    /// Cells
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell")else{
            return UITableViewCell()
        }
        cell.textLabel?.text = devDataManager.devs[indexPath.row].name
        return cell
    }
}
