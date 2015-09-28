import XCTest
import Padlock
import Nest
import Inquiline


func helloWorld(request:RequestType) -> ResponseType {
  return Response(.Ok, body: "Hello world")
}


func isValidCredentials(username:String, password:String) -> Bool {
  return username == "kyle" && password == "nest"
}


class PadlockTests: XCTestCase {
  func testNoCredentials() {
    let request = Request(method: "GET", path: "/")
    let response = 🔒(isValidCredentials, application: helloWorld)(request)
    XCTAssertEqual(response.statusLine, "401 UNAUTHORIZED")
  }

  func testInvalidCredentials() {
    let request = Request(method: "GET", path: "/", headers:[("Authorization", "kyle secret")])
    let response = 🔒(isValidCredentials, application: helloWorld)(request)
    XCTAssertEqual(response.statusLine, "401 UNAUTHORIZED")
  }

  func testValidCredentials() {
    let request = Request(method: "GET", path: "/", headers:[("Authorization", "kyle nest")])
    let response = 🔒(isValidCredentials, application: helloWorld)(request)
    XCTAssertEqual(response.statusLine, "200 OK")
  }
}
