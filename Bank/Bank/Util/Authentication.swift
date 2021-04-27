public struct Authentication: Model {
    
    public init(user: String?, password: String?) {
        self.user = user
        self.password = password
    }
    
    let user: String?
    let password: String?
}
