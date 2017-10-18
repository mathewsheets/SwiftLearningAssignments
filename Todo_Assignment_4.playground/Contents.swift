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
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true
URLCache.shared = URLCache(memoryCapacity: 0, diskCapacity: 0, diskPath: nil)

TodoApi.todoService = TodoHTTPService(host: "http://cscc-todos.getsandbox.com")

print("get all todos")
//try! TodoApi.getTodos { (completion: HandlerTodos) in
//    do {
//        let todos = try completion()
//
//        print(todos)
//    } catch  {
//        print("Error info: \(error)")
//    }
//}

print("create a todo")
//let todo = TodoModel()
//todo.title = "Complete Assignment 4"
//todo.body = "Assignment 4 is due May 10"
//todo.priority = 2
//todo.done = false
//
//try! TodoApi.createTodo(todo: todo) { (completion: HandlerTodo) in
//    do {
//        let todo = try completion()
//
//        print(todo!)
//    } catch  {
//        print("Error info: \(error)")
//    }
//}

print("get a single todo")
//try! TodoApi.getTodo(id: "13edd085-4da8-4484-6762-f356e4699add") { (completion: HandlerTodo) in
//    do {
//        let todo = try completion()
//
//        print(todo!)
//    } catch  {
//        print("Error info: \(error)")
//    }
//}

print("update a todo")
//try! TodoApi.getTodo(id: "13edd085-4da8-4484-6762-f356e4699add") { (completion: HandlerTodo) in
//    do {
//        let todo = try completion()
//
//        todo!.done = true
//
//        try! TodoApi.updateTodo(todo: todo!) { (completion: HandlerVoid) in
//            do {
//                try completion()
//
//            } catch  {
//                print("Error info: \(error)")
//            }
//        }
//    } catch  {
//        print("Error info: \(error)")
//    }
//}

print("delete a todo")
//try! TodoApi.deleteTodo(id: "13edd085-4da8-4484-6762-f356e4699add") { (completion: HandlerVoid) in
//    do {
//        try completion()
//
//    } catch  {
//        print("Error info: \(error)")
//    }
//}

