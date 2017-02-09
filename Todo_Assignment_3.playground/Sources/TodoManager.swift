import Foundation

public class TodoManager {
    
    var todos = [Todo]()
    
    public init() {
        
    }

    public func get(id: String) -> Todo? {

        guard let index = (indexOf() { $0.id == id }) else { return nil }
        
        return todos[index]
    }

    public func add(todo: Todo) -> Todo {
        
        todos.append(todo)
        
        return todo
    }
    
    public func update(todo: Todo) -> Todo? {
        
        guard let index = (indexOf() { $0.id == todo.id }) else { return nil }
        
        todos[index] = todo
        return todo
    }
    
    public func delete(id: String) -> Todo? {
        
        guard let index = (indexOf() { $0.id == id }) else { return nil }
        
        return todos.remove(at: index)
    }

    func iterator(closure: (_ todo: Todo) -> Void) {
        
        for index in 0..<todos.count {
            
            closure(todos[index])
        }
    }
    
    public func each(closure: (_ todo: Todo, _ index: Int) -> Void) {
        
        var index = 0;
        
        iterator() {
            
            closure($0, index)
            
            index += 1
        }
    }
    
    public func pluck(closure: (_ todo: Todo) -> String) -> [String] {
        
        var plucked = [String]()
        
        iterator() { plucked.append(closure($0)) }
        
        return plucked
    }
    
    public func indexOf(closure: (_ todo: Todo) -> Bool) -> Int? {
        
        var index = -1
        var found = false
        
        iterator() { (todo) -> Void in
            
            if !found {
                
                if closure(todo)  {
                    found = true
                }
                
                index += 1
            }
        }
        
        return index == -1 || !found ? nil : index
    }
    
    public func filter(closure: (_ todo: Todo) -> Bool) -> [Todo]? {
        
        var filter = [Todo]()
        
        iterator() { (todo) -> Void in
            
            if closure(todo) {
                
                filter.append(todo)
            }
        }
        
        return !filter.isEmpty ? filter : nil
    }

}
