//
//  MainViewController.swift
//  MealApp
//
//  Created by BerkayKar on 14.08.2023.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet private weak var categoriesButton: UIButton!
    @IBOutlet private weak var mainTitle: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func categoriesButtonTapped(_ sender: UIButton) {
        navigationController?.pushViewController(CategoryViewController(), animated: true)
    }
    
}
