import Foundation

public protocol TodoService {

    func getTodos(success: (_ todos: [TodoModel]) -> Void, error:(_ error: NSError) -> Void)
    
    func createTodo(todo: TodoModel, success: (_ todo: TodoModel) -> Void, error:(_ error: NSError) -> Void)
    
    func getTodo(id: Int, success: (_ todo: TodoModel) -> Void, error:(_ error: NSError) -> Void)
    
    func updateTodo(todo: TodoModel, success: (_ todo: TodoModel) -> Void, error:(_ error: NSError) -> Void)
    
    func deleteTodo(todo: TodoModel, success: () -> Void, error:(_ error: NSError) -> Void)

}
