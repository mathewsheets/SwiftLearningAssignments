import Foundation

public var todos = [Todo]()

public func initData() {
    
    addTodo(createTodo("Weed", subtitle: "Flower beds and garden", description: "Need to weed the flower beds and garden. Get one of the buys to help."))
    addTodo(createTodo("Study", subtitle: "Swift Exam coming up", description: "Study for the swift exam coming up in the next few weeks"))
    addTodo(createTodo("Food", subtitle: "Saturday date night dinner", description: "Need to get food for Saturday's date night"))
}
