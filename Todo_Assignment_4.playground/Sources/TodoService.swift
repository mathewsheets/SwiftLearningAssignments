import Foundation

public typealias HandlerTodos = () throws -> [TodoModel]
public typealias HandlerTodo = () throws -> TodoModel?
public typealias HandlerVoid = () throws -> Void

public protocol TodoService {
    
    func getTodos(completion: @escaping (HandlerTodos) -> Void) throws
    
    func createTodo(todo: TodoModel, completion: @escaping (HandlerTodo) -> Void) throws
    
    func getTodo(id: String, completion: @escaping (HandlerTodo) -> Void) throws
    
    func updateTodo(todo: TodoModel, completion: @escaping (HandlerVoid) -> Void) throws
    
    func deleteTodo(id: String, completion: @escaping (HandlerVoid) -> Void) throws
}
