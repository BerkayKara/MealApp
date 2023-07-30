//
//  CategoryViewController.swift
//  MealApp
//
//  Created by BerkayKar on 21.07.2023.
//

import UIKit

class CategoryViewController: UIViewController {

    @IBOutlet weak var categoryTableView: UITableView!
    
    private let viewModel = CategoryViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        fetchCategories()
        categoryTableView.reloadData()
    }
    
    func registerCells() {
        categoryTableView.register(UINib(nibName: "CategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "CategoryTableViewCell")
    }
    
    func fetchCategories() {
        viewModel.getCategories()
    }
    
}
//MARK: TableView Methods
extension CategoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell", for: indexPath) as! CategoryTableViewCell
        if !(viewModel.categories.count > 0) {
            return UITableViewCell()
        }
        if let title = viewModel.categories[indexPath.row].strCategory,
           let description = viewModel.categories[indexPath.row].strCategoryDescription {
            cell.configView(image: "", title: title,
                            description: description)
        }
        return cell
    }
    
}
