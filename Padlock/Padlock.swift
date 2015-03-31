//
//  Padlock.swift
//  Padlock
//
//  Created by Kyle Fuller on 31/03/2015.
//  Copyright (c) 2015 Cocode. All rights reserved.
//

import Foundation

public typealias Request = [String:AnyObject]
public typealias Response = (String, [(String, String)], String?)

public typealias ValidCredentials = (username:String, password:String) -> Bool

func notAuthorized(request:Request) -> Response {
  return ("401 UNAUTHORIZED", [("WWW-Authenticate", "Basic realm=\"Secure Area\"")], nil)
}

public func 🔒(validCredentials:ValidCredentials, application:(Request) -> (Response))(request:Request) -> Response {
  if let authorization = request["HTTP_AUTHORIZATION"] as? String {
    let components = authorization.componentsSeparatedByString(" ")
    if countElements(components) == 2 {
      let username = components[0]
      let password = components[1]
      if validCredentials(username: username, password: password) {
        return application(request)
      }
    }
  }

  return notAuthorized(request)
}
