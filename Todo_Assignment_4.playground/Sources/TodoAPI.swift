import Foundation

public class TodoAPI {

    private static var todoService: TodoService?
    public static func setTodoService(todoService: TodoService) {

        TodoAPI.todoService = todoService
    }

    public static func getTodos(success: (_ todos: [TodoModel]) -> Void, error:(_ error: Error) -> Void) {
        guard let safeTodoService = todoService else {
            error(createError(message: "Missing Service", code: 2000))
            return
        }
        
        safeTodoService.getTodos(success: success, error: error)
    }
    
    public static func createTodo(todo: TodoModel, success: (_ todo: TodoModel) -> Void, error:(_ error: Error) -> Void) {
        guard let safeTodoService = todoService else {
            error(createError(message: "Missing Service", code: 2000))
            return
        }
        
        safeTodoService.createTodo(todo: todo, success: success, error: error)
    }
    
    public static func getTodo(id: Int, success: (_ todo: TodoModel) -> Void, error:(_ error: Error) -> Void) {
        guard let safeTodoService = todoService else {
            error(createError(message: "Missing Service", code: 2000))
            return
        }
        
        safeTodoService.getTodo(id: id, success: success, error: error)
    }
    
    public static func updateTodo(todo: TodoModel, success: (_ todo: TodoModel) -> Void, error:(_ error: Error) -> Void) {
        guard let safeTodoService = todoService else {
            error(createError(message: "Missing Service", code: 2000))
            return
        }
        
        safeTodoService.updateTodo(todo: todo, success: success, error: error)
    }
    
    public static func deleteTodo(todo: TodoModel, success: () -> Void, error:(_ error: Error) -> Void) {
        guard let safeTodoService = todoService else {
            error(createError(message: "Missing Service", code: 2000))
            return
        }
        
        safeTodoService.deleteTodo(todo: todo, success: success, error: error)
    }
    
    private static func createError(message: String, code: Int) -> NSError {
        
        return Error(domain: message, code: code, userInfo: nil)
    }
    
}
