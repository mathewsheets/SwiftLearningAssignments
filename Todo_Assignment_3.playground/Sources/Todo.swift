import Foundation

public enum TodoStatus: String {
    case NotStarted = "Not Started"
    case InProgress = "In Progress"
    case Stopped
    case Completed
}

public struct Coordinate {

    public var latitude: Double?
    public var longitude: Double?
}

public class Person {

    public var id: String?
    public var first: String?
    public var middle: String?
}

public class Todo: CustomStringConvertible {

    public var id: String?
    public var title: String?
    public var subtitle: String?
    public var status: TodoStatus?
    public var assignedTo: Person?
    public var location: Coordinate?
    public var tags: [String]?
    public var created: NSDate?
    public var published: NSDate?
    public var updated: NSDate?
    
    public var description: String {
        
        return id ?? ""
    }
}
