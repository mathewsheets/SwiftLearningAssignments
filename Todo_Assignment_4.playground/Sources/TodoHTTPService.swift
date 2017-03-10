import Foundation

public class TodoHTTPService: TodoService {
    
    public enum Route: String {
        case Gets   = "/todos"
        case Get    = "/todo/"
        case Create = "/todo/create"
        case Update = "/todo/update/"
        case Delete = "/todo/delete/"
        
        var method: String {
            
            switch self {
            case .Gets:
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

    private static let todoPath = "/todo-ios/todos/api/v1.0"
    
    private var host: String
    private var session: URLSession
    
    public init(host: String) {
        
        self.host = host
        
        session = URLSession.shared
    }
    
    private func getPath(route: Route, id: Int? = nil) -> String {
        
        var idPortion = ""
        if id != nil {
            idPortion = "\(id!)"
        }

        let path = "\(host)\(TodoHTTPService.todoPath)\(route.rawValue)\(idPortion)"

        return path
    }
    
    public func getTodos(success: @escaping (_ todos: [TodoModel]) -> Void, error: @escaping (_ error: Error) -> Void) {

        let task = session.dataTask(with: createRequest(route: .Gets)){ [weak self] (data, response, err) -> Void in
            guard let weakSelf = self else { return }
            if weakSelf.hasErrors(data, response: response, error: err, onError: error) {
                return
            }

            weakSelf.handledJSONPayload(payload: data!, success: { (json) in

                if let jsonTodos = json as? [String:AnyObject] {
                    if let todoArray = jsonTodos["todos"] as? [[String:AnyObject]] {
                        
                        var todos = [TodoModel]()
                        
                        for todoDictionary in todoArray {
                            
                            todos.append(TodoModel(dictionary: todoDictionary))
                        }
                        
                        success(todos: todos)
                    }
                } else {
                    error(error: weakSelf.createError(message: "I was expecting a dictonary", code: 1000))
                }
            }, error: { (err) in
                error(error: err)
            })
        }
        task.resume()
    }
    
    public func createTodo(todo: TodoModel, success: (_ todo: TodoModel) -> Void, error:(_ error: Error) -> Void) {
        
        let json = createRequestPayload(todo.asDictionary, error: { (err) in
            error(error: err)
            return
        })
        
        let request = createRequest(.Create)
        request.HTTPBody = json
        
        let task = session.dataTaskWithRequest(request){ [weak self] (data, response, err) -> Void in
            guard let weakSelf = self else { return }
            if weakSelf.hasErrors(data, response: response, error: err, onError: error) {
                return
            }
            
            weakSelf.handledJSONPayload(payload: data!, success: { (json) in
                if let todoDictionary = json as? [String:AnyObject] {
                    success(todo: TodoModel(dictionary: todoDictionary))
                } else {
                    error(error: weakSelf.createError(message: "I was expecting a dictonary", code: 1000))
                }
            }, error: { (err) in
                error(error: err)
            })
        }
        task.resume()
    }
    
    public func getTodo(id: Int, success: (_ todo: TodoModel) -> Void, error:(_ error: Error) -> Void) {
        
        let task = session.dataTaskWithRequest(createRequest(.Get, id: id)){ [weak self] (data, response, err) -> Void in
            guard let weakSelf = self else { return }
            if weakSelf.hasErrors(data, response: response, error: err, onError: error) {
                return
            }
            
            weakSelf.handledJSONPayload(payload: data!, success: { (json) in
                if let todoMainDictionary = json as? [String:AnyObject] {
                    if let todoDictionary = todoMainDictionary["todo"] as? [String:AnyObject] {
                        success(todo: TodoModel(dictionary: todoDictionary))
                    }
                } else {
                    error(error: weakSelf.createError(message: "I was expecting a dictonary", code: 1000))
                }
            }, error: { (err) in
                error(error: err)
            })
        }
        task.resume()
    }
    
    public func updateTodo(todo: TodoModel, success: (_ todo: TodoModel) -> Void, error:(_ error: Error) -> Void) {
        
        let json = createRequestPayload(todo.asDictionary, error: { (err) in
            error(error: err)
            return
        })
        
        let request = createRequest(.Update, id: todo.id!)
        request.HTTPBody = json
        
        let task = session.dataTaskWithRequest(request){ [weak self] (data, response, err) -> Void in
            guard let weakSelf = self else { return }
            if weakSelf.hasErrors(data, response: response, error: err, onError: error) {
                return
            }
            
            weakSelf.handledJSONPayload(payload: data!, success: { (json) in
                if let todoMainDictionary = json as? [String:AnyObject] {
                    if let todoDictionary = todoMainDictionary["todo"] as? [String:AnyObject] {
                        success(todo: TodoModel(dictionary: todoDictionary))
                    }
                } else {
                    error(error: weakSelf.createError(message: "I was expecting a dictonary", code: 1000))
                }
            }, error: { (err) in
                error(error: err)
            })
        }
        task.resume()
    }
    
    public func deleteTodo(todo: TodoModel, success: () -> Void, error:(_ error: Error) -> Void) {
        
        let task = session.dataTask(with: createRequest(route: .Delete, id: todo.id!)){ [weak self] (data, response, err) -> Void in
            guard let weakSelf = self else { return }
            if weakSelf.hasErrors(data, response: response, error: err, onError: error) {
                return
            }
            
            success()
        }
        task.resume()
    }
    
    
    private func createRequest(route: Route, id: Int? = nil) -> URLRequest {

        let request = URLRequest(url: NSURL(string: getPath(route: route, id: id))!)

        request.setCommonHeaders(route)
        
        return request
    }
    
    private func createRequestPayload(dictionary: [String:AnyObject], error:(_ error: Error) -> Void) -> Data? {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: dictionary, options: .prettyPrinted)
            
            let jsonPayload = String(data: jsonData, encoding: String.Encoding.utf8)!
            
            print(jsonPayload)
            
            return jsonPayload.data(using: String.Encoding.utf8)
            
        } catch let err {
            error(err)
        }
        
        return nil
    }
    
    private func hasErrors(data: Data?, response: URLResponse?, error: Error?, onError: (_ error: Error) -> Void) -> Bool {
        guard error == nil else {
            onError(error!)
            return true
        }
        let statusCode = (response as? HTTPURLResponse)?.statusCode
        guard statusCode! >= 200 && statusCode < 300, let _ = data else {
            
            onError(error: createError(message: "HTTP Error", code: statusCode!))
            return true
        }
        
        return false
    }
    
    private func handledJSONPayload(payload: Data, success: (_ json: AnyObject) -> Void, error:(_ error: Error) -> Void) {
        do {
            if let jsonObject: AnyObject = try JSONSerialization.jsonObject(with: payload, options: .MutableContainers) {

                success(jsonObject)

            } else {
                error(createError(message: "could not deserialize", code: 1100))
            }
        } catch let err {
            error(err)
        }
    }
    
    private func createError(message: String, code: Int) -> Error {
        
        return Error(domain: message, code: code, userInfo: nil)
    }
}
