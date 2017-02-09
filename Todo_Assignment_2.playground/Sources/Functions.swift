import Foundation

// todo functions

public func getTodos(closure: (_ todo: Todo) -> Bool) -> [Todo]? {
    
    return filter(todos: todos, closure: closure)
}

public func getTodo(id: String) -> Todo? {

    guard let index = (indexOf(todos: todos) { $0.0 == id }) else {
        return nil
    }

    return todos[index]
}

public func createTodo(title: String, subtitle: String, description: String) -> Todo {
    
    return (String(todos.count), title, subtitle, description, Status.NotStarted)
}

public func addTodo(todo: Todo) -> Todo {
    
    todos.append(todo)
    
    return todo
}

public func updateTodo(todo: Todo) -> Todo? {

    guard let index = (indexOf(todos: todos) { $0.0 == todo.0 }) else {
        return nil
    }

    todos[index] = todo
    return todo
}

public func deleteTodo(id: String) -> Todo? {

    guard let index = (indexOf(todos: todos) { $0.0 == id }) else {
        return nil
    }

    return todos.remove(at: index)
}

public func description(todo: Todo) -> String {
    
    let (id, title, subtitle, description, status) = todo
    
    return "id: \(id)\n\ttitle: \(title)\n\tsubtitle: \(subtitle)\n\tdescription: \(description)\n\tstatus: \(status.rawValue)"
}

// querying functions

func iterator(todos: [Todo], closure: (_ todo: Todo) -> Void) {
    
    for index in 0..<todos.count {
        
        closure(todos[index])
    }
}

public func each(todos: [Todo], closure: (_ todo: Todo, _ index: Int) -> Void) {
    
    var index = 0;
    
    iterator(todos: todos) {
        
        closure($0, index)
        
        index += 1
    }
}

public func pluck(todos: [Todo], closure: (_ todo: Todo) -> String) -> [String] {
    
    var plucked = [String]()
    
    iterator(todos: todos) { plucked.append(closure($0)) }
    
    return plucked
}

public func indexOf(todos: [Todo], closure: (_ todo: Todo) -> Bool) -> Int? {

    var index = -1
    var found = false

    iterator(todos: todos) { (todo) -> Void in

        if !found {

            if closure(todo)  {
                found = true
            }

            index += 1
        }
    }

    return index == -1 || !found ? nil : index
}

public func filter(todos: [Todo], closure: (_ todo: Todo) -> Bool) -> [Todo]? {
    
    var filter = [Todo]()
    
    iterator(todos: todos) { (todo) -> Void in
        
        if closure(todo) {
            
            filter.append(todo)
        }
    }

    return !filter.isEmpty ? filter : nil
}
