import Foundation

public func getTodos(closure: (todo: Todo) -> Bool) -> [Todo]? {
    
    return filter(todos, closure: closure)
}

public func getTodo(id: String) -> Todo? {

    guard let index = (indexOf(todos) { $0.0 == id }) else {
        return nil
    }

    return todos[index]
}

public func createTodo(title: String, subtitle: String, description: String) -> Todo {
    
    return (String(todos.count), title, subtitle, description)
}

public func addTodo(todo: Todo) -> Todo {
    
    todos.append(todo)
    
    return todo
}

public func updateTodo(todo: Todo) -> Todo? {

    guard let index = (indexOf(todos) { $0.0 == todo.0 }) else {
        return nil
    }

    todos[index] = todo
    return todo
}

public func deleteTodo(id: String) -> Todo? {

    guard let index = (indexOf(todos) { $0.0 == id }) else {
        return nil
    }

    return todos.removeAtIndex(index)
}

func iterator(todos: [Todo], closure: (todo: Todo) -> Void) {
    
    for var index = 0; index < todos.count; ++index {
        
        closure(todo: todos[index])
    }
}

public func pluck(todos: [Todo], closure: (todo: Todo) -> String) -> [String] {
    
    var plucked = [String]()
    
    iterator(todos) { plucked.append(closure(todo: $0)) }
    
    return plucked
}

func indexOf(todos: [Todo], closure: (todo: Todo) -> Bool) -> Int? {

    var index = -1
    var found = false

    iterator(todos) { (todo) -> Void in

        if !found {

            if closure(todo: todo)  {
                found = true
            }

            index++
        }
    }

    return index == -1 || !found ? nil : index
}

func filter(todos: [Todo], closure: (todo: Todo) -> Bool) -> [Todo]? {
    
    var filter = [Todo]()
    
    iterator(todos) { (todo) -> Void in
        
        if closure(todo: todo) {
            
            filter.append(todo)
        }
    }

    return !filter.isEmpty ? filter : nil
}
