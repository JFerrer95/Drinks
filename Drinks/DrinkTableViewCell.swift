//
//  DrinkTableViewCell.swift
//  Drinks
//
//  Created by jonathan ferrer on 9/27/20.
//

import UIKit

class DrinkTableViewCell: UITableViewCell {
    
    
    var drink: Drink?
    @IBOutlet weak var drinkImageView: UIImageView!
    @IBOutlet weak var drinkNameLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func likeButtonPressed(_ sender: Any) {
        drink?.isSaved.toggle()
        likeButton.setImage(UIImage(systemName: drink?.isSaved == true ? "suit.heart.fill" : "suit.heart"), for: .normal)
        guard let drink = drink else { return }
        print("\(drink.name) is \(drink.isSaved)")
    }
    
    func set(drink: Drink) {
        self.drink = drink
        let thumbnailURL = URL(string: drink.thumbnail)
        do {
            let thumbnailData = try Data(contentsOf: thumbnailURL!)
            let thumbnailImage = UIImage(data: thumbnailData)
            drinkImageView?.image = thumbnailImage
        } catch {
            print(error)
        }
        
        drinkNameLabel.text = drink.name
        categoryLabel.text = drink.category
        drinkImageView.layer.cornerRadius = 11
    }
    
    
}
