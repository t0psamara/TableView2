//
//  ViewController.swift
//  TableView2
//
//  Created by Nikita Petrenkov on 24.07.2021.
//

import UIKit

struct Meal {
    let title: String
    let category: MealCategory
}

enum MealCategory: String {
    case first = "Первое блюдо"
    case second = "Второе блюдо"
    case salads = "Салаты"
    case drink = "Напитки"
    
    var backgroundColor: UIColor {
        switch self {
        case .first:
            return #colorLiteral(red: 0.6844225875, green: 0.9828391484, blue: 1, alpha: 1)
        case .second:
            return #colorLiteral(red: 1, green: 0.7132432931, blue: 0.7421878801, alpha: 1)
        case .salads:
            return #colorLiteral(red: 0.6743623763, green: 1, blue: 0.6822961434, alpha: 1)
        case .drink:
            return #colorLiteral(red: 1, green: 0.9988998357, blue: 0.3828920722, alpha: 1)
        }
    }
}



class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let meals: [Meal] = [
        .init(title: "Оливье", category: .salads),
        .init(title: "Селёдка под шубой", category: .salads),
        .init(title: "Борщ", category: .first),
        .init(title: "Гуляш", category: .second),
        .init(title: "Чай", category: .drink),
        .init(title: "Кофе", category: .drink),
        .init(title: "Кефир", category: .drink),
        .init(title: "Плов", category: .second)
    ]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
    }

    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let currentMeal = meals[indexPath.row]
        
        // Если четный индекс
        if indexPath.row % 2 == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)
            
            cell.textLabel?.text = currentMeal.title
            
            cell.detailTextLabel?.text = currentMeal.category.rawValue
            
            cell.contentView.backgroundColor = currentMeal.category.backgroundColor
            return cell
            // Если это нечетный индекс
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! TableCell
            
            cell.configureCell(meal: currentMeal)
            
            return cell
        }
        
        
    }
}

