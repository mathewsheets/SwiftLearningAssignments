import Foundation

public class TodoModel: CustomStringConvertible {
    
    public var id: String?
    public var title: String?
    public var body: String?
    public var priority: Int?
    public var done: Bool?
    
    public init() {
        
    }
    
    public init(dictionary: [String:AnyObject]) {
        
        id = dictionary["id"] as? String
        title = dictionary["title"] as? String
        body = dictionary["body"] as? String
        priority = dictionary["priority"] as? Int
        done = dictionary["done"] as? Bool
    }

    public var description: String {

        return "[id: \(id ?? ""), title: \(title ?? ""), body: \(body ?? ""), priority: \(priority ?? -1), done: \(done ?? false)]"
    }
    
    public var asDictionary: [String:AnyObject] {
        
        var dictionary = [String:AnyObject]()
        
        dictionary["id"] = id as AnyObject?
        dictionary["title"] = title as AnyObject?
        dictionary["body"] = body as AnyObject?
        dictionary["priority"] = priority as AnyObject?
        dictionary["done"] = done as AnyObject?
        
        return dictionary
    }
}

extension TodoModel: Equatable {

    public static func ==(lhs: TodoModel, rhs: TodoModel) -> Bool {
        
        return lhs.description == rhs.description
    }

}

extension TodoModel: Hashable {
    
    public var hashValue: Int {
        
        return description.hashValue
    }
}

extension Array where Element: TodoModel {
    
    public var asDictionary: [[String:AnyObject]] {
        
        var dictionaries = [[String:AnyObject]]()
        
        for element in self {
            
            dictionaries.append(element.asDictionary)
        }
        
        return dictionaries
    }
}
