//
//  MealDao.swift
//  eggplant-brownie
//
//  Created by ivan favarin on 19/10/19.
//  Copyright © 2019 ivan favarin. All rights reserved.
//

import Foundation

class MealDao{
    
    
    func save(_ meals: [Meal]){
        if let path = getPath()
        {
            do
            {
                let data = try NSKeyedArchiver.archivedData(withRootObject: meals, requiringSecureCoding: false)
                
                try data.write(to: path)
            }
            catch
            {
                print(error.localizedDescription)
            }
        }
    }
    
    func getMeals() -> [Meal] {
        if let path = getPath()
        {
            do{
                let data = try Data(contentsOf: path)
                guard let savedMeals = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? Array<Meal> else {return []}
                return savedMeals
            }
            catch
            {
                print(error.localizedDescription)
                return []
            }
        }
        return []
    }
    
    
    func getPath() -> URL?{
        if let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        {
            let path = directory.appendingPathComponent("meal")
            return path
        }
        return nil
    }
}
