import Foundation

public enum Status: String {
    case NotStarted = "Not Started"
    case InProgress = "In Progress"
    case Stopped
    case Completed
}

//public typealias Location = (Double, Double)
//public typealias Person = (String, String)

public typealias Todo = (
    String,     // id
    String,     // title
    String,     // subtitle
    String,     // description
    Status
//    Person,     // createdBy
//    NSDate,     // createdDate
//    Location?,  // location
//    [String]?,  // tags
//    Person?,    // assignedTo
//    NSDate?,    // publishDate
//    NSDate?     // updatedDate
)
