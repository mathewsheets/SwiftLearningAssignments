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

try! TodoApi.getTodos { (completion: Handler) in
    do {
        let todos = try completion() as! [TodoModel]
        
        print(todos.asDictionary)
    } catch  {
        print("Error info: \(error)")
    }
}
