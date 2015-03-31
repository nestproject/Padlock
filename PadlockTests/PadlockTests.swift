//
//  PadlockTests.swift
//  PadlockTests
//
//  Created by Kyle Fuller on 31/03/2015.
//  Copyright (c) 2015 Cocode. All rights reserved.
//

import Cocoa
import XCTest
import Padlock

func helloWorld(env:Request) -> (Response) {
  return ("200 OK", [], "Hello World")
}

func isValidCredentials(username:String, password:String) -> Bool {
  return username == "kyle" && password == "nest"
}

class PadlockTests: XCTestCase {
  func testNoCredentials() {
    let response = 🔒(isValidCredentials, helloWorld)(request:[:])
    XCTAssertEqual(response.0, "401 UNAUTHORIZED")
  }

  func testInvalidCredentials() {
    let response = 🔒(isValidCredentials, helloWorld)(request:["HTTP_AUTHORIZATION": "kyle secret"])
    XCTAssertEqual(response.0, "401 UNAUTHORIZED")
  }

  func testValidCredentials() {
    let response = 🔒(isValidCredentials, helloWorld)(request:["HTTP_AUTHORIZATION": "kyle nest"])
    XCTAssertEqual(response.0, "200 OK")
  }
}
