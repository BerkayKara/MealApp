//
//  CategoryModel.swift
//  MealApp
//
//  Created by BerkayKar on 21.07.2023.
//

import Foundation

struct CategoryResponse: Decodable {
    let categories: [Category]
}

struct Category: Decodable {
    let idCategory: String?
    let strCategory: String?
    let strCategoryThumb: String?
    let strCategoryDescription: String?
}
