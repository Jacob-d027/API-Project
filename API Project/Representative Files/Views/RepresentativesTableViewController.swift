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

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return representatives.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepresentativeCell", for: indexPath) as! RepresentativeTableViewCell
        
        
        // Configure the cell...

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension RepresentativesTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {        fetchRepresentatives()
        searchBar.resignFirstResponder()
    }
}
