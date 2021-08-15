# WrapperCodable

`WrapperCodable`  is a library that supports parsing `propertywrapper`  without breaking the JSON data format.

As is known to all Properties wrapped by `propertywrapper` will break the codable parsing structure. `WrapperCodable` can change that.

Just make your propertywrappers conform `WrapperCodable` protocol.

``` swift
@propertyWrapper
struct TestWrapper<Value: Codable>: WrapperCodable {
    
    var wrappedValue: Value
    
}

struct Person: Codable, Equatable {
    @TestWrapper
    var name: String
    
    static func == (lhs: Person, rhs: Person) -> Bool {
        lhs.name == rhs.name
    }
}

let person = Person(name: "GodL")
let data = try! JSONEncoder().encode(person)

let decodePerson = try! JSONDecoder().decode(Person.self, from: data)

XCTAssertEqual(person, decodePerson)
```

## Installation
### Swift Package Manager
[Swift Package Manager](https://swift.org/package-manager/) is Apple's decentralized dependency manager to integrate libraries to your Swift projects. It is now fully integrated with Xcode 11

To integrate `WrapperCodable` into your project using SPM, specify it in your `Package.swift` file:

```swift
let package = Package(
    …
    dependencies: [
        .package(url: "https://github.com/GodL/WrapperCodable.git", from: "0.0.1"),
    ],
    targets: [
        .target(name: "YourTarget", dependencies: ["WrapperCodable", …])
        …
    ]
)
``

## Author

GodL, 547188371@qq.com. Github [GodL](https://github.com/GodL)

*I am happy to answer any questions you may have. Just create a [new issue](https://github.com/GodL/WrapperCodable/issues/new).*

## License

MIT License

Copyright (c) 2021 GodL

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
`
