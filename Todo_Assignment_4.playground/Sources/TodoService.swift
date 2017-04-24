import Foundation

public typealias Handler = () throws -> Any

public protocol TodoService {
    
    func getTodos(completion: @escaping (Handler) -> Void) throws
    
    func createTodo(todo: TodoModel, completion: @escaping (Handler) -> Void) throws
    
    func getTodo(id: String, completion: @escaping (Handler) -> Void) throws
    
    func updateTodo(todo: TodoModel, completion: @escaping (Handler) -> Void) throws
    
    func deleteTodo(id: String, completion: @escaping (Handler) -> Void) throws
}
