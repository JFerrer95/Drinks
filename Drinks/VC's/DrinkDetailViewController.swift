//
//  DrinkDetailViewController.swift
//  Drinks
//
//  Created by jonathan ferrer on 9/24/20.
//

import UIKit

class DrinkDetailViewController: UIViewController {
    
    var drink: Drink?
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var instructionsTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getIngredients()
        setUpViews()
    }
    
    func setUpViews() {
        guard let drink = drink else { return }
        nameLabel.text = drink.name
        categoryLabel.text = drink.category
        instructionsTextView.text = drink.instructions
        
    }
    
    func getIngredients() {
        let allIngredients = [drink?.ingredient1, drink?.ingredient2, drink?.ingredient3, drink?.ingredient4, drink?.ingredient5, drink?.ingredient6, drink?.ingredient7, drink?.ingredient8, drink?.ingredient9, drink?.ingredient10, drink?.ingredient11, drink?.ingredient12]
        var ingredients = [String]()
        
        for ingredient in allIngredients {
            if ingredient != nil {
                ingredients.append(ingredient!)
            }
        }
        print(ingredients.count)
    }


}
