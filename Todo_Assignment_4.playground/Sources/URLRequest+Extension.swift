import Foundation


extension URLRequest {

    public static func getBasicAuth(username: String, password: String) -> String {
        
        let authString = String(format: "%@:%@", username, password)
        let authData: NSData = authString.data(using: String.Encoding.utf8)! as NSData
        let base64authString = authData.base64EncodedString(options: .lineLength64Characters)
        
        return base64authString
    }
    
    public mutating func setRequestBasicAuth(username: String, password: String) {
        
        let basicAuth = "Basic \(URLRequest.getBasicAuth(username: username, password: password))"

        setValue(basicAuth, forHTTPHeaderField: "Authorization")
        
    }
    
    public mutating func setCommonHeaders(route: TodoHTTPService.Route) {
        
        httpMethod = route.method
        addValue("application/json", forHTTPHeaderField: "Content-Type")
        setRequestBasicAuth(username: "msheets", password: "password")

        print("\(httpMethod) \(url!.absoluteString)")
    }
}
