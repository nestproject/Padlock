# 🔒

Nest example middleware to wrap your web application in HTTP auth.

**NOTE**: *This is also the very first published Pod to use emoji as its name.*

## Installation

```ruby
pod '🔒'
```

## Usage

```swift
import Padlock

func application(env:Request) -> (Response) {
  return ("200 OK", [], "Hello World")
}

func isValidCredentials(username:String, password:String) -> Bool {
  return username == "kyle" && password == "nest"
}

let secureApplication = 🔒(isValidCredentials, application)

serve("127.0.0.1", 8080, secureApplication)
```

## License

🔒 is licensed under the BSD license. See [LICENSE](LICENSE) for more information.

