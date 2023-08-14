//
//  CategoryViewController.swift
//  MealApp
//
//  Created by BerkayKar on 14.08.2023.
//

import UIKit

class CategoryViewController: UIViewController {

    @IBOutlet weak var categoryTableView: UITableView!
    
    private var dataSource: [Category] = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        fetchCategories()
    }
    
    func registerCells() {
        categoryTableView.register(UINib(nibName: "CategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "CategoryTableViewCell")
    }
    
    func fetchCategories() {
        let vm = CategoryViewModel(delegate: self)
        vm.fetchCategories()
    }
    
}
//MARK: TableView Methods
extension CategoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell", for: indexPath) as! CategoryTableViewCell
        if !(dataSource.count > 0) {
            return UITableViewCell()
        }
        if let title = dataSource[indexPath.row].strCategory,
           let imageUrl = dataSource[indexPath.row].strCategoryThumb,
           let description = dataSource[indexPath.row].strCategoryDescription {
            cell.configView(image: imageUrl, title: title,
                            description: description)
        }
        return cell
    }
    
}

extension CategoryViewController: CategoryViewModelDelegate {
    func categoriesFetched(categories: [Category]) {
        self.dataSource = categories
        DispatchQueue.main.async {
            self.categoryTableView.reloadData()
        }
    }
    
}
