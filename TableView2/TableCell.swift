//
//  TableCell.swift
//  TableView2
//
//  Created by Nikita Petrenkov on 24.07.2021.
//

import UIKit


class TableCell: UITableViewCell {
    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    func configureCell(meal: Meal) {
        categoryLabel.text = meal.category.rawValue
        
        nameLabel.text = meal.title
        
        contentView.backgroundColor = meal.category.backgroundColor
    }
}
