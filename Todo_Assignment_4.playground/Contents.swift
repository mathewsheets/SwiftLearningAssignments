/*:
 * callout(Assignment): Based on Sessions 1-15 (specifically Protocols, Extensions, Generics, JSON & Instances, HTTP & ReST), create a playground that will manage your todos.
 
 **You will need to:**
 - Print all your Todos (small description)
 - Print a single Todo (large description)
 - Add a Todo
 - Update a Todo
 - Delete a Todo
 
 **Constraints:**
 - Create a container protocol to store data
 - Create a data type comforming to your container
 - Serialize and deserialize the data within your container
 - Leverage a ReSTful web service to retrieve todo
 - Create methods on your manager class to:
    - Get all your Todos
    - Get a single Todo passing an id as an argument
    - Add a Todo
    - Update a Todo
    - Delete a Todo
 */
import Foundation
import XCPlayground

//TodoAPI.setTodoService(TodoHTTPService(host: "http://todo.eastus.cloudapp.azure.com"))

//TodoAPI.getTodos({ (todos) in
//    print(todos)
//}) { print($0) }

//TodoAPI.getTodo(6, success: { (todo) in
//    print(todo)
//}) { print($0) }

//TodoAPI.getTodo(6, success: { (todo) in
//    TodoAPI.deleteTodo(todo, success: {
//        print("Deleted!")
//    }, error: { (error) in
//        print(error)
//    })
//}) { print($0) }

//let todo = TodoModel()
//todo.title = "Lunch"
//todo.body = "Having lunch"
//todo.priority = 3
//
//TodoAPI.createTodo(todo, success: { (todo) in
//    print(todo)
//}) { print($0) }

//TodoAPI.getTodo(0, success: { (todo) in
//    todo.priority = 3
//
//    TodoAPI.updateTodo(todo, success: { (todo) in
//        print(todo)
//    }, error: { (error) in
//        print(error)
//    })
//}) { print($0) }










XCPlaygroundPage.currentPage.needsIndefiniteExecution = true
