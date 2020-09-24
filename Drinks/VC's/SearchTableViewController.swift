//
//  SearchTableViewController.swift
//  Meme
//
//  Created by jonathan ferrer on 9/24/20.
//

import UIKit

class SearchTableViewController: UITableViewController, UISearchBarDelegate {

    let drinkController = DrinkController()
    var drinks = [Drink]()
    
    @IBOutlet var searchBar: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text else { return }
        drinkController.searchDrink(searchTerm: searchTerm) { (error, drinks) in
            if let error = error {
                print("errorrrr \(error)")
            }
            guard let drinks = drinks else { return }
            self.drinks = drinks.drinks
            DispatchQueue.main.async {
                
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "drinkCell", for: indexPath)
        
        let drink = drinks[indexPath.row]
        let thumbnailURL = URL(string: drink.thumbnail)
        do {
            let thumbnailData = try Data(contentsOf: thumbnailURL!)
            let thumbnailImage = UIImage(data: thumbnailData)
            cell.imageView?.image = thumbnailImage
        } catch {
            print(error)
        }
        cell.textLabel?.text = drink.name
        cell.detailTextLabel?.text = drink.category
        
        return cell
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
