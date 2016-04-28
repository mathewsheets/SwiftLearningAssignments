import Foundation

public enum TodoStatus: String {
    case NotStarted = "Not Started"
    case InProgress = "In Progress"
    case Stopped
    case Completed
}

public struct Coordinate {

    public var latitude: Double
    public var longitude: Double
    
    public init(latitude: Double, longitude: Double) {
        
        self.latitude = latitude
        self.longitude = longitude
    }
}

public class Person {

    public var id: String?
    public var first: String?
    public var middle: String?
    
    public init() {
        
    }
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

        return "\tid: \(id ?? "")\n\ttitle: \(title ?? "")\n\tsubtitle: \(subtitle ?? "")\n\tstatus: \(status?.rawValue ?? "")"
    }

    public init() {

    }
}
