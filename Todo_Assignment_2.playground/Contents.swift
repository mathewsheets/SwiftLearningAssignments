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

    each(todos) { (todo, index) -> Void in
        
        print("\t\(todo.0): \(todo.1) = \(todo.4)")
    }
}

initData()

print("Print all your Todos (small description)")
printTodos(todos)

print("\nPrint a single Todo (large description)")
var study = getTodo("1")!
print("\t\(description(study))\n")

print("Add a Todo")
let sweep = createTodo("Sweep", subtitle: "The stairs need a cleaning", description: "Sweep the stairs and then the bedrooms")
addTodo(sweep)
printTodos(todos)

print("\nUpdate a Todo")
updateTodo((study.0, study.1, study.2, study.3, Status.Completed))
study = getTodo("1")!
print("\t\(description(study))")

print("Delete a Todo")
let weed = deleteTodo("0")!
print("\t\(description(weed))\n")

print("Updated list of Todos")
printTodos(todos)

print("\nDisplay only non completed todos")
let nonComplete = filter(todos) { $0.4 != .Completed }
printTodos(nonComplete ?? [])
