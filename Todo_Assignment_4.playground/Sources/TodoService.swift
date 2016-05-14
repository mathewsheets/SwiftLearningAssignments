import Foundation

public protocol TodoService {

    func getTodos(success: (todos: [TodoModel]) -> Void, error:(error: NSError) -> Void)
    
    func createTodo(todo: TodoModel, success: (todo: TodoModel) -> Void, error:(error: NSError) -> Void)
    
    func getTodo(id: Int, success: (todo: TodoModel) -> Void, error:(error: NSError) -> Void)
    
    func updateTodo(todo: TodoModel, success: (todo: TodoModel) -> Void, error:(error: NSError) -> Void)
    
    func deleteTodo(todo: TodoModel, success: () -> Void, error:(error: NSError) -> Void)

}
