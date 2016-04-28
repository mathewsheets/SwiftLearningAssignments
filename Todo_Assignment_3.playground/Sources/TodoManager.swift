import Foundation

public class TodoManager {
    
    private var todos = [Todo]()
    
    public func getTodos() -> [Todo] {

        return todos
    }

    public func getTodo(id: String) -> Todo? {

        guard let index = (indexOf(todos) { $0.id == id }) else { return nil }
        
        return todos[index]
    }

    public func addTodo(todo: Todo) -> Todo {
        
        todos.append(todo)
        
        return todo
    }
    
    public func updateTodo(todo: Todo) -> Todo? {
        
        guard let index = (indexOf(todos) { $0.id == todo.id }) else { return nil }
        
        todos[index] = todo
        return todo
    }
    
    public func deleteTodo(id: String) -> Todo? {
        
        guard let index = (indexOf(todos) { $0.id == id }) else { return nil }
        
        return todos.removeAtIndex(index)
    }

    func iterator(todos: [Todo], closure: (todo: Todo) -> Void) {
        
        for index in 0..<todos.count {
            
            closure(todo: todos[index])
        }
    }
    
    public func each(todos: [Todo], closure: (todo: Todo, index: Int) -> Void) {
        
        var index = 0;
        
        iterator(todos) {
            
            closure(todo: $0, index: index)
            
            index += 1
        }
    }
    
    public func pluck(todos: [Todo], closure: (todo: Todo) -> String) -> [String] {
        
        var plucked = [String]()
        
        iterator(todos) { plucked.append(closure(todo: $0)) }
        
        return plucked
    }
    
    public func indexOf(todos: [Todo], closure: (todo: Todo) -> Bool) -> Int? {
        
        var index = -1
        var found = false
        
        iterator(todos) { (todo) -> Void in
            
            if !found {
                
                if closure(todo: todo)  {
                    found = true
                }
                
                index += 1
            }
        }
        
        return index == -1 || !found ? nil : index
    }
    
    public func filter(todos: [Todo], closure: (todo: Todo) -> Bool) -> [Todo]? {
        
        var filter = [Todo]()
        
        iterator(todos) { (todo) -> Void in
            
            if closure(todo: todo) {
                
                filter.append(todo)
            }
        }
        
        return !filter.isEmpty ? filter : nil
    }

}
