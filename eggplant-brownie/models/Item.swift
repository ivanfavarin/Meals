import Foundation

class Item: NSObject, NSCoding{
   
    
    let name:String
    let calories:Double
    
    init(name:String, calories:Double) {
        self.name = name
        self.calories = calories
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(calories, forKey: "calories")
       }
       
       required init?(coder: NSCoder) {
        name = coder.decodeObject(forKey: "name") as! String
        calories = coder.decodeDouble(forKey: "calories")
       }
}

func ==(first:Item, second:Item) -> Bool{
    return first.name == second.name &&
        first.calories == second.calories
}
