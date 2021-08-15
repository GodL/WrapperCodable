    import XCTest
    @testable import WrapperCodable
    
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

    final class WrapperCodableTests: XCTestCase {
        
      
        func testExample() {
            
            // test WrapperEncode
            let person = Person(name: "GodL")
            let data = try! JSONEncoder().encode(person)
            
            let decodePerson = try! JSONDecoder().decode(Person.self, from: data)
            
            XCTAssertEqual(person, decodePerson)
            // This is an example of a functional test case.
            // Use XCTAssert and related functions to verify your tests produce the correct
            // results.
        }
    }
