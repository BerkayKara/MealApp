//
//  CategoryTableViewCell.swift
//  MealApp
//
//  Created by BerkayKar on 21.07.2023.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var categoryDescription: UILabel!
    @IBOutlet weak var cetagoryTitle: UILabel!
    @IBOutlet weak var categoryImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configView(image: String, title: String, description: String) {
        categoryDescription.text = description
        cetagoryTitle.text = title
        guard let url = URL(string: image) else { return }
        categoryImage.load(url: url)
    }
    
}
