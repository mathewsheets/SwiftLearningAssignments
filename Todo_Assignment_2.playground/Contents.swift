/*:
**Assignment:** Based on Sessions 1-7 (specifically Collection Types, Functions, Closures, Enumerations), create a playground that will manage your todos.
>> **You will need to:**
* Print all your Todos (small description)
* Print a single Todo (large description)
* Add a Todo
* Update a Todo
* Delete a Todo
>> **Constraints:**
* Model a Todo
* Create functions to:
    * Get all your Todos
    * Get a single Todo passing an id as an argument
    * Add a Todo
    * Update a Todo
    * Delete a Todo
*/
import Foundation

initData()

print("Print all your Todos (small description)")
each(todos) { (todo, index) -> Void in

    print("\t\(todo.1)")
}

print("Print a single Todo (large description)")
each(todos) { (todo, index) -> Void in
    
    print("\t\(description(todo))\n")
}

print("Add a Todo")

print("Update a Todo")

print("Delete a Todo")
