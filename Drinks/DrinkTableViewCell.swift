//
//  DrinkTableViewCell.swift
//  Drinks
//
//  Created by jonathan ferrer on 9/27/20.
//

import UIKit

class DrinkTableViewCell: UITableViewCell {
    
    
    var drink: Drink?
    
    let cache = NetworkController.shared.cache
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
        drinkNameLabel.text = drink.name
        categoryLabel.text = drink.category
        drinkImageView.layer.cornerRadius = 11
        
        updateImageView(imageURL: drink.thumbnail)
        

        
    }
    
    func updateImageView(imageURL: String) {
        let urlString = NSString(string: imageURL)
        if let image = cache.object(forKey: urlString) {
            print("from Cashhhhhhhh")
            drinkImageView.image = image
            return
        }
        do {
            let thumbnailURL = URL(string: imageURL)
            let thumbnailData = try Data(contentsOf: thumbnailURL!)
            guard let thumbnailImage = UIImage(data: thumbnailData) else { return }
            cache.setObject(thumbnailImage, forKey: urlString)
            drinkImageView?.image = thumbnailImage
            print("to cash it goes tho")
        } catch {
            print(error)
        }
    }
    
    
}
