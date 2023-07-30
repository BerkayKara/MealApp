//
//  CategoryViewModel.swift
//  MealApp
//
//  Created by BerkayKar on 21.07.2023.
//

import Foundation

class CategoryViewModel {
    
    var categories: [Category] = []
    
    func getCategories() {
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/categories.php") else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            // check response status and err
            guard let data = data else { return }
            do {
                let response = try JSONDecoder().decode(CategoryResponse.self, from: data)
                self.categories = response.categories
            } catch {
                print("Failed to decode: \(error)")
            }
        }.resume()
    }
}
