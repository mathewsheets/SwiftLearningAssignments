import Foundation

public enum Status: String {
    case NotStarted = "Not Started"
    case InProgress = "In Progress"
    case Stopped
    case Completed
}

public typealias Todo = (
    String,     // id
    String,     // title
    String,     // subtitle
    String,     // description
    Status
)
