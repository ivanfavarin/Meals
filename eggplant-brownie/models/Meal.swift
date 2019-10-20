import Foundation

class Meal: NSObject, NSCoding{
    
    
    
    
    let name:String
    let happiness:Int
    let items:Array<Item>
    
    // Mark: - Init
    
    init(name:String, happiness:Int, items: Array<Item> = []) {
        self.name = name
        self.happiness = happiness
        self.items = items
    }
    
    // MARK: - NSCoding
    
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(happiness, forKey: "happiness")
        coder.encode(items, forKey: "items")
    }
    
    required init?(coder: NSCoder) {
        name = coder.decodeObject(forKey: "name") as! String
        happiness = coder.decodeInteger(forKey: "happiness")
        items = coder.decodeObject(forKey: "items") as! Array<Item>        
    }
    
    // MARK: - Métodos
    
    func allCalories() -> Double{
        var total = 0.0
        for item in items{
            total += item.calories
        }
        return total
    }
    
    func details() -> String{
        var message = "Felicidade: \(happiness)"
        
        for item in items{
            message += ", \(item.name) - calorias: \(item.calories)"
        }
        return message
    }
}
