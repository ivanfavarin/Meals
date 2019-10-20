//
//  RemoveMealViewController.swift
//  eggplant-brownie
//
//  Created by ivan favarin on 19/10/19.
//  Copyright © 2019 ivan favarin. All rights reserved.
//

import UIKit

class RemoveMealViewController{
    
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func show(_ meal: Meal, handler: @escaping (UIAlertAction) -> Void) {
        
        let alert = UIAlertController(title: meal.name, message: meal.details(), preferredStyle: .alert)
        
        let cancelButton = UIAlertAction(title: "Cancelar", style: .cancel)
        
        alert.addAction(cancelButton)
        
        let removeButton = UIAlertAction(title: "Remover", style: .destructive, handler: handler)
        
        alert.addAction(removeButton)
        controller.present(alert, animated: true, completion: nil)
        
    }
}
