import Foundation

public class TodoModel: CustomStringConvertible {
    
    public var id: Int?
    public var title: String?
    public var body: String?
    public var priority: Int?
    public var done: Bool?
    
    public init() {
        
    }
    
    public init(dictionary: [String:AnyObject]) {
        
        id = dictionary["id"] as? Int
        title = dictionary["title"] as? String
        body = dictionary["body"] as? String
        priority = dictionary["priority"] as? Int
        done = dictionary["done"] as? Bool
    }

    public var description: String {

        return "id: \(id ?? -1), title: \(title ?? ""), body: \(body ?? ""), priority: \(priority ?? -1), done: \(done ?? false)"
    }
    
    var asDictionary: [String:AnyObject] {
        
        var dictionary = [String:AnyObject]()
        
        dictionary["id"] = id
        dictionary["title"] = title
        dictionary["body"] = body
        dictionary["priority"] = priority
        dictionary["done"] = done
        
        return dictionary
    }
    
}

public func ==(lhs: TodoModel, rhs: TodoModel) -> Bool {
    
    return lhs.description == rhs.description
}

extension TodoModel: Equatable {}

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
