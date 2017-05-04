import Foundation

public enum TodoApiError: Error {
    
    case ServiceNotSet
    case NoData
    case RequestError(message: String)
    case ResponseError(message: String)
    case Unknown(message: String)
}

public class TodoApi {
    
    public static var todoService: TodoService?
    
    public static func getTodos(completion: @escaping (HandlerTodos) -> Void) throws {
        
        guard let safeTodoService = todoService else { throw TodoApiError.ServiceNotSet }
        
        return try safeTodoService.getTodos(completion: completion)
    }
    
    public static func createTodo(todo: TodoModel, completion: @escaping (HandlerTodo) -> Void) throws {
        
        guard let safeTodoService = todoService else { throw TodoApiError.ServiceNotSet }
        
        return try safeTodoService.createTodo(todo: todo, completion: completion)
    }
    
    public static func getTodo(id: String, completion: @escaping (HandlerTodo) -> Void) throws {
        
        guard let safeTodoService = todoService else { throw TodoApiError.ServiceNotSet }
        
        return try safeTodoService.getTodo(id: id, completion: completion)
    }
    
    public static func updateTodo(todo: TodoModel, completion: @escaping (HandlerVoid) -> Void) throws {
        
        guard let safeTodoService = todoService else { throw TodoApiError.ServiceNotSet }
        
        return try safeTodoService.updateTodo(todo: todo, completion: completion)
    }
    
    public static func deleteTodo(id: String, completion: @escaping (HandlerVoid) -> Void) throws {
        
        guard let safeTodoService = todoService else { throw TodoApiError.ServiceNotSet }
        
        return try safeTodoService.deleteTodo(id: id, completion: completion)
    }
}
