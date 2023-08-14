//
//  CategoryViewModel.swift
//  MealApp
//
//  Created by BerkayKar on 21.07.2023.
//

import Foundation

protocol CategoryViewModelDelegate: NSObject {
    func categoriesFetched(categories: [Category])
}

class CategoryViewModel {
    
    private var categories: [Category] = []
    private var delegate: CategoryViewModelDelegate?
    
    init(delegate: CategoryViewModelDelegate?) {
        self.delegate = delegate
    }
    
    
    func fetchCategories() {
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/categories.php") else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            // check response status and err
            guard let data = data else { return }
            do {
                let response = try JSONDecoder().decode(CategoryResponse.self, from: data)
                self.categories = response.categories
                self.delegate?.categoriesFetched(categories: self.categories)
            } catch {
                print("Failed to decode: \(error)")
            }
        }.resume()
    }
}
