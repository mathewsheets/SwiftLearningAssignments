/*:
 * callout(Assignment): Based on Sessions 1-7 (specifically Collection Types, Functions, Closures, Enumerations), create a playground that will manage your todos.

 **You will need to:**
 - Print all your Todos (small description)
 - Print a single Todo (large description)
 - Add a Todo
 - Update a Todo
 - Delete a Todo

 **Constraints:**
 - Model a Todo
 - Create functions to:
    - Get all your Todos
    - Get a single Todo passing an id as an argument
    - Add a Todo
    - Update a Todo
    - Delete a Todo
 */
import Foundation

func printTodos(todos: [Todo]) {

    each(todos: todos) { (todo, index) -> Void in
        
        print("\t\(todo.0): \(todo.1) = \(todo.4)")
    }
}

initData()

print("Print all your Todos (small description)")
printTodos(todos: todos)

print("\nPrint a single Todo (large description)")
var study = getTodo(id: "1")!
print("\t\(description(todo: study))\n")

print("Add a Todo")
let sweep = createTodo(title: "Sweep", subtitle: "The stairs need a cleaning", description: "Sweep the stairs and then the bedrooms")
addTodo(todo: sweep)
printTodos(todos: todos)

print("\nUpdate a Todo")
updateTodo(todo: (study.0, study.1, study.2, study.3, Status.Completed))
study = getTodo(id: "1")!
print("\t\(description(todo: study))")

print("\nDelete a Todo")
let weed = deleteTodo(id: "0")!
print("\t\(description(todo: weed))\n")

print("Updated list of Todos")
printTodos(todos: todos)

print("\nDisplay only non completed todos")
let nonComplete = filter(todos: todos) { $0.4 != .Completed }
printTodos(todos: nonComplete ?? [])
