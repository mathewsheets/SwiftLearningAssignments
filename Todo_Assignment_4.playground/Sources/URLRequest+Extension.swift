import Foundation

extension URLRequest {
    
    public mutating func setCommonHeaders(operation: TodoHTTPService.Operation) {
        
        httpMethod = operation.method
        addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        print("\(httpMethod!) \(url!.absoluteString)")
    }
}
