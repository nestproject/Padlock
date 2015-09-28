import Nest
import Inquiline


public typealias ValidCredentials = (username:String, password:String) -> Bool

func notAuthorized(request:RequestType) -> ResponseType {
  return Response(.Unauthorized, headers:[("WWW-Authenticate", "Basic realm=\"Secure Area\"")])
}

public func 🔒(validCredentials:ValidCredentials, application:RequestType -> ResponseType)(_ request:RequestType) -> ResponseType {
  if let authorization = request.authorization {
    let components = authorization.componentsSeparatedByString(" ")
    if components.count == 2 {
      let username = components[0]
      let password = components[1]
      if validCredentials(username: username, password: password) {
        return application(request)
      }
    }
  }

  return notAuthorized(request)
}
