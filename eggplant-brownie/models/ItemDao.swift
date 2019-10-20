//
//  ItemDao.swift
//  eggplant-brownie
//
//  Created by ivan favarin on 19/10/19.
//  Copyright © 2019 ivan favarin. All rights reserved.
//

import Foundation

class ItemDao{
    
    
    
    func save(_ items: [Item])
    {
        do
        {
            let data = try NSKeyedArchiver.archivedData(withRootObject: items, requiringSecureCoding: false)
            if let path = getPath()
            {
                try data.write(to: path)
            }
        }
        catch
        {
            print(error.localizedDescription)
        }
    }
    
    
    func getSavedItens() -> [Item]
    {
        guard let path = getPath() else { return [] }
        do
        {
            let data = try Data(contentsOf: path)
            let savedItems = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as! [Item]
            return savedItems
        }
        catch
        {
            print(error.localizedDescription)
            return []
        }
    }
    
    
    func getPath() -> URL?{
        if let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        {
            let path = directory.appendingPathComponent("items")
            return path
        }
        return nil
    }
}
