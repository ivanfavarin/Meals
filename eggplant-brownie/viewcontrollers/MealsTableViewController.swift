//
//  MealsTableViewController.swift
//  eggplant-brownie
//
//  Created by ivan favarin on 15/10/19.
//  Copyright © 2019 ivan favarin. All rights reserved.
//

import UIKit

class MealsTableViewConroller : UITableViewController, AddAMealDelegate
{
    
    var meals = [Meal]()
    
    override func viewDidLoad() {
        meals = MealDao().getMeals()
    }
    func add(_ meal:Meal)
    {
        meals.append(meal)
        tableView.reloadData()
        MealDao().save(meals)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "addMeal"){
            let view = segue.destination as! ViewController
            view.delegate = self
        }
    }    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let meal = meals[row]
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: nil)
        cell.textLabel!.text = meal.name
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(showDetails(_:)))
        cell.addGestureRecognizer(longPress)
        
        
        return cell
    }
    
    @objc func showDetails(_ gesture: UILongPressGestureRecognizer){
        if gesture.state == .began
        {
            let cell = gesture.view as! UITableViewCell
            
            if let indexPath = tableView.indexPath(for: cell){
                let meal = meals[indexPath.row]
                RemoveMealViewController(controller: self).show(meal, handler:
                    { alert in
                        self.meals.remove(at: indexPath.row)
                        self.tableView.reloadData()
                })
            }
        }
    }
    
    
}
