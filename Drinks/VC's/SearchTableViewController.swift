//
//  SearchTableViewController.swift
//  Meme
//
//  Created by jonathan ferrer on 9/24/20.
//

import UIKit

class SearchTableViewController: UITableViewController, UISearchBarDelegate {
    
    var drinks = [Drink]()
    
    @IBOutlet var searchBar: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
        guard let searchTerm = searchBar.text else { return }
        let view = UIViewController()
        present(view, animated: true, completion: nil)
        NetworkController.shared.searchDrink(searchTerm: searchTerm) { (error, drinks) in
            
            if let error = error {
                print("errorrrr \(error)")
            }
            guard let drinks = drinks else { return }
            self.drinks = drinks.drinks
            
            DispatchQueue.main.async {
                view.dismiss(animated: true, completion: nil)
                self.tableView.reloadData()
            }
            
        }
    }
    
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return drinks.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "drinkCell", for: indexPath) as! DrinkTableViewCell
        
        let drink = drinks[indexPath.row]
        cell.set(drink: drink)

        return cell
    }
    
    
    
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "drinkPressed" {
            let destinationVC = segue.destination as? DrinkDetailViewController
            guard let index = tableView.indexPathForSelectedRow else { return }
            destinationVC?.drink = drinks[index.row]
        }
    }
    
}
