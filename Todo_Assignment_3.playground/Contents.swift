/*:
 * callout(Assignment): Based on Sessions 1-10 (specifically Classes & Structures, More Classes & Structures, Inheritance), create a playground that will manage your todos.
 
 **You will need to:**
 - Print all your Todos (small description)
 - Print a single Todo (large description)
 - Add a Todo
 - Update a Todo
 - Delete a Todo
 
 **Constraints:**
 - Model a Todo using a Class or Structure
 - Create a class that will manage your Todos, no global functions
 - Create methods on your manager class to:
     - Get all your Todos
     - Get a single Todo passing an id as an argument
     - Add a Todo
     - Update a Todo
     - Delete a Todo
 */
import Foundation

let manager = TodoManager()

let todo1 = Todo()
todo1.id = "a0b2c9e8-7e3c-4ae1-acbc-ca763a731cc3"
todo1.title = "Exercies 1 - 14"
todo1.subtitle = "Exercies for SwiftLearning, 1 - 14"
todo1.status = .InProgress

manager.add(todo: todo1)

manager.each { (todo, index) in
    
    print("\(todo.title!)")
}

manager.each { (todo, index) in
    
    print("\(index + 1))\n\(todo)")
}

todo1.status = .Completed

manager.update(todo: todo1)

manager.each { (todo, index) in
    
    print("\(index + 1))\n\(todo)")
}

manager.delete(id: "a0b2c9e8-7e3c-4ae1-acbc-ca763a731cc3")

print("--- any todos ---")
manager.each { (todo, index) in
    
    print("\(index + 1))\n\(todo)")
}
