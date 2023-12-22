//
//  RepresentativesTableViewController.swift
//  API Project
//
//  Created by Jacob Davis on 12/5/23.
//

import UIKit

class RepresentativesTableViewController: UITableViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    var representatives = [Representative]()
    var representativeController = RepresentativeController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return representatives.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepresentativeCell", for: indexPath) as! RepresentativeTableViewCell
        let representative = representatives[indexPath.row]
        cell.update(with: representative)
        
        return cell
    }

    func fetchRepresentatives() {
        self.representatives = []
        self.tableView.reloadData()
        let zipcode = searchBar.text!
        
        if !zipcode.isEmpty {
            Task {
                do {
                    let searchResponse = try await representativeController.fetchRepresentatives(from: zipcode)
                    self.representatives = searchResponse.results
                    tableView.reloadData()
                } catch {
                    print("An error occurred: \(error.localizedDescription)")
                }
            }
        }
    }

}


extension RepresentativesTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {        
        fetchRepresentatives()
        searchBar.resignFirstResponder()
    }
    
}
