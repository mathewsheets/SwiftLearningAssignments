import Foundation

public class TodoAPI {

    private static var todoService: TodoService?
    public static func setTodoService(todoService: TodoService) {

        TodoAPI.todoService = todoService
    }

    public static func getTodos(success: (todos: [TodoModel]) -> Void, error:(error: NSError) -> Void) {
        guard let safeTodoService = todoService else {
            error(error: createError("Missing Service", code: 2000))
            return
        }
        
        safeTodoService.getTodos(success, error: error)
    }
    
    public static func createTodo(todo: TodoModel, success: (todo: TodoModel) -> Void, error:(error: NSError) -> Void) {
        guard let safeTodoService = todoService else {
            error(error: createError("Missing Service", code: 2000))
            return
        }
        
        safeTodoService.createTodo(todo, success: success, error: error)
    }
    
    public static func getTodo(id: Int, success: (todo: TodoModel) -> Void, error:(error: NSError) -> Void) {
        guard let safeTodoService = todoService else {
            error(error: createError("Missing Service", code: 2000))
            return
        }
        
        safeTodoService.getTodo(id, success: success, error: error)
    }
    
    public static func updateTodo(todo: TodoModel, success: (todo: TodoModel) -> Void, error:(error: NSError) -> Void) {
        guard let safeTodoService = todoService else {
            error(error: createError("Missing Service", code: 2000))
            return
        }
        
        safeTodoService.updateTodo(todo, success: success, error: error)
    }
    
    public static func deleteTodo(todo: TodoModel, success: () -> Void, error:(error: NSError) -> Void) {
        guard let safeTodoService = todoService else {
            error(error: createError("Missing Service", code: 2000))
            return
        }
        
        safeTodoService.deleteTodo(todo, success: success, error: error)
    }
    
    private static func createError(message: String, code: Int) -> NSError {
        
        return NSError(domain: message, code: code, userInfo: nil)
    }
    
}