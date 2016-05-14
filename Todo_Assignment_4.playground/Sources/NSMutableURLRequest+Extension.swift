import Foundation

extension NSMutableURLRequest {

    public static func getBasicAuth(username: String, password: String) -> String {
        
        let authString = String(format: "%@:%@", username, password)
        let authData: NSData = authString.dataUsingEncoding(NSUTF8StringEncoding)!
        let base64authString = authData.base64EncodedStringWithOptions(.Encoding64CharacterLineLength)
        
        return base64authString
    }
    
    public func setRequestBasicAuth(username: String, password: String) {
        
        let basicAuth = "Basic \(NSMutableURLRequest.getBasicAuth(username, password: password))"
        
        setValue(basicAuth, forHTTPHeaderField: "Authorization")
    }
    
    public func setCommonHeaders(route: TodoHTTPService.Route) {
        
        HTTPMethod = route.method
        addValue("application/json", forHTTPHeaderField: "Content-Type")
        setRequestBasicAuth("msheets", password: "password")

        print("\(HTTPMethod) \(URL!.absoluteString)")
    }
}
