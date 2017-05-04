import Foundation

public class TodoHTTPService: TodoService {
    
    public enum Operation: String {
        case Index
        case Get
        case Create
        case Update
        case Delete
        
        var method: String {
            
            switch self {
            case .Index:
                return "GET"
            case .Get:
                return "GET"
            case .Create:
                return "POST"
            case .Update:
                return "PUT"
            case .Delete:
                return "DELETE"
            }
        }
    }
    
    private static let todoPath = "/todos"
    
    private var host: String
    private var session: URLSession
    
    public init(host: String) {
        
        self.host = host
        
        session = URLSession.shared
    }
    
    private func getPath(operation: Operation, id: String? = nil) -> String {
        
        let idPortion = id != nil ? "/\(id!)" : ""
        
        return "\(host)\(TodoHTTPService.todoPath)\(idPortion)"
    }
    
    public func getTodos(completion: @escaping (HandlerTodos) -> Void) throws {
        
        session.dataTask(with: createRequest(operation: .Index)) { [weak self] (data, response, error) in
            
            guard let weakSelf = self else { return }
            
            completion() {
                
                try weakSelf.checkForErrors(data: data, response: response, error: error)
                let json = try weakSelf.handledJSONPayload(payload: data!)
                
                var todos = [TodoModel]()
                
                if let jsonTodos = json as? [[String : AnyObject]] {
                    
                    for todoDictionary in jsonTodos {
                        
                        todos.append(TodoModel(dictionary: todoDictionary))
                    }
                }
                
                return todos
            }
        }.resume()
    }
    
    public func createTodo(todo: TodoModel, completion: @escaping (HandlerTodo) -> Void) throws {
        
        var request = createRequest(operation: .Create)
        request.httpBody = try createRequestPayload(dictionary: todo.asDictionary)
        
        session.dataTask(with: request) { [weak self] (data, response, error) in
            
            guard let weakSelf = self else { return }
            
            completion() {
                
                try weakSelf.checkForErrors(data: data, response: response, error: error)
                let json = try weakSelf.handledJSONPayload(payload: data!)
                
                if let jsonTodo = json as? [String : AnyObject] {
                    
                    return TodoModel(dictionary: jsonTodo)
                }
                
                return nil
            }
        }.resume()
    }
    
    public func getTodo(id: String, completion: @escaping (HandlerTodo) -> Void) throws {
        
        session.dataTask(with: createRequest(operation: .Get, id: id)) { [weak self] (data, response, error) in
            
            guard let weakSelf = self else { return }
            
            completion() {
                
                try weakSelf.checkForErrors(data: data, response: response, error: error)
                let json = try weakSelf.handledJSONPayload(payload: data!)
                
                if let jsonTodo = json as? [String : AnyObject] {
                    
                    return TodoModel(dictionary: jsonTodo)
                }
                
                return nil
            }
        }.resume()
    }
    
    public func updateTodo(todo: TodoModel, completion: @escaping (HandlerVoid) -> Void) throws {
        
        var request = createRequest(operation: .Update, id: todo.id!)
        request.httpBody = try createRequestPayload(dictionary: todo.asDictionary)
        
        session.dataTask(with: request) { [weak self] (data, response, error) in
            
            guard let weakSelf = self else { return }
            
            completion() {
                
                try weakSelf.checkForErrors(data: data, response: response, error: error)
            }
        }.resume()
    }
    
    public func deleteTodo(id: String, completion: @escaping (HandlerVoid) -> Void) throws {
        
        session.dataTask(with: createRequest(operation: .Delete, id: id)) { [weak self] (data, response, error) in
            
            guard let weakSelf = self else { return }
            
            completion() {
                
                try weakSelf.checkForErrors(data: data, response: response, error: error)
            }
        }.resume()
    }
    
    private func checkForErrors(data: Data?, response: URLResponse?, error: Error?) throws {
        
        if let error = error { throw error }
        guard data != nil else { throw TodoApiError.NoData }
        let statusCode = (response as? HTTPURLResponse)?.statusCode
        guard statusCode! >= 200, statusCode! < 300 else { throw TodoApiError.ResponseError(message: "response code: \(statusCode!)")}
    }
    
    private func createRequest(operation: Operation, id: String? = nil) -> URLRequest {
        
        var request = URLRequest(url: URL(string: getPath(operation: operation, id: id))!)
        
        request.setCommonHeaders(operation: operation)
        
        return request
    }
    
    private func createRequestPayload(dictionary: [String: AnyObject]) throws -> Data? {
        
        let jsonData = try JSONSerialization.data(withJSONObject: dictionary, options: .prettyPrinted)
        
        let jsonPayload = String(data: jsonData, encoding: .utf8)!
        
        print(jsonPayload)
        
        return jsonPayload.data(using: .utf8)
    }
    
    private func handledJSONPayload(payload: Data) throws -> Any {
        
        return try JSONSerialization.jsonObject(with: payload, options: .mutableContainers)
    }
    
}
