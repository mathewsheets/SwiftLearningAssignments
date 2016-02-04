
import Foundation

var todos = (
    (id: 1, title: "First Todo", date: "01-31-16", desc: "My first todo item", assigned: (first: "Mathew", last: "Sheets")),
    (id: 2, title: "Second Todo", date: "01-31-16", desc: "My second todo item", assigned: (first: "Jack", last: "Sheets"))
)

//iterate(todos) { (label, value) -> (label: String, value: Any) in
//    
//    print("\(label) - \(value)")
//    
//    return (label, value)
//}

let todosMirror = Mirror(reflecting: todos)
for case let (label?, value) in todosMirror.children {

    print(label)

    let todoMirror = Mirror(reflecting: value)
    for case let (label?, value) in todoMirror.children {
        
        print("\t\(value)")
        
        let nameMirror = Mirror(reflecting: value)
        for case let (label?, value) in nameMirror.children {
            
            print("\t\t\(value)")
        }
    }
}
