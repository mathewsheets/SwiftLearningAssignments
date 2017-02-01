/*:
 * callout(Assignment): Based on Sessions 1 - 3 (Basics | DataTypes | Operators, Strings | Characters | Dates, Control Flow), create a playground that will manage your todos.
 
 **You will need to:**
 - Print all your Todos (small description)
 - Print a single Todo (large description)
 - Add a Todo
 - Update a Todo
 - Delete a Todo

 **Constraints:**
 - Use a tuple to model each Todo
 - Use a single tuple to group all your Todos
 - Investigate what a `Mirror` is and how it can be leveraged
 */
import Foundation

let todos = (
            (id: 1, title: "First Todo", date: "02-14-16", desc: "My first todo item", assigned: (first: "Mathew", last: "Sheets")),
            (id: 2, title: "Second Todo", date: "02-15-16", desc: "My second todo item", assigned: (first: "Jack", last: "Sheets")),
            (id: 3, title: "Third Todo", date: "02-16-16", desc: "My third todo item", assigned: (first: "Sam", last: "Sheets"))
            )
var todo1 = (0, "", "", "", ("", ""))
var todo2 = (0, "", "", "", ("", ""))
var todo3 = (0, "", "", "", ("", ""))

print("Print all your todos (small description)")
var todosMirror = Mirror(reflecting: todos)
for case let (label?, todo) in todosMirror.children {
    let todoMirror = Mirror(reflecting: todo)
    for case let (label?, value) in todoMirror.children {
        if label == ".1" { // this is the title
            print("\t\(value)")
        }
    }
}

print("")
print("Print a single todo (large description)")
todosMirror = Mirror(reflecting: todos)
for case let (label?, todo) in todosMirror.children {
    if label == ".0" {
        let todoMirror = Mirror(reflecting: todo)
        var output = ""
        for case let (label?, value) in todoMirror.children {
            switch label {
            case ".0":
                output += "id: \(value), "
            case ".2":
                output += "date: \(value), "
            case ".3":
                output += "description: \(value)"
            default:
                break
            }
        }
        print("\t\(output)")
    }
}

print("")
print("Add a todo")
var todo4 = (id: 4, title: "Fourth Todo", date: "02-17-16", desc: "My fourth todo item", assigned: (first: "Hudson", last: "Sheets"))
todosMirror = Mirror(reflecting: todos)
for case let (label?, todo) in todosMirror.children {
    var tuple = todo as! (Int, String, String, String, (String, String))
    switch label {
    case ".0":
        todo1 = tuple
    case ".1":
        todo2 = tuple
    case ".2":
        todo3 = tuple
    default:
        break
    }
}
let todoPlus1 = (todo1, todo2, todo3, todo4)
todosMirror = Mirror(reflecting: todoPlus1)
for case let (label?, todo) in todosMirror.children {
    let todoMirror = Mirror(reflecting: todo)
    for case let (label?, value) in todoMirror.children {
        if label == ".1" { // this is the title
            print("\t\(value)")
        }
    }
}

print("")
print("Update a todo")
todosMirror = Mirror(reflecting: todos)
for case let (label?, todo) in todosMirror.children {
    if label == ".0" {
        var tuple = todo as! (Int, String, String, String, (String, String))
        tuple.1 = "1st Todo"
        print("\t\(tuple)")
    }
}

print("")
print("Delete a todo")
todosMirror = Mirror(reflecting: todoPlus1)
for case let (label?, todo) in todosMirror.children {
    var tuple = todo as! (Int, String, String, String, (String, String))
    switch label {
    case ".0":
        todo1 = tuple
    case ".2":
        todo2 = tuple
    case ".3":
        todo3 = tuple
    default:
        break
    }
}
let todoMinus1 = (todo1, todo2, todo3)
todosMirror = Mirror(reflecting: todoMinus1)
for case let (label?, todo) in todosMirror.children {
    let todoMirror = Mirror(reflecting: todo)
    for case let (label?, value) in todoMirror.children {
        if label == ".1" { // this is the title
            print("\t\(value)")
        }
    }
}
