
import Foundation

var todo1 = (title: "First Todo", date: "01-31-16", desc: "My first todo item", assigned: (first: "Mathew", last: "Sheets"))
var todo2 = (title: "Second Todo", date: "01-31-16", desc: "My second todo item", assigned: (first: "Jack", last: "Sheets"))

var todos = (todo1, todo2)

iterate(todos) { (label, value) -> (label: String, value: Any) in
    
    print("\(label) - \(value)")
    
    return (label, value)
}
