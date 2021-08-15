//MIT License
//
//Copyright (c) 2021 GodL
//
//Permission is hereby granted, free of charge, to any person obtaining a copy
//of this software and associated documentation files (the "Software"), to deal
//in the Software without restriction, including without limitation the rights
//to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//copies of the Software, and to permit persons to whom the Software is
//furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in all
//copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//SOFTWARE.


/// Properties that are decorated by a `PropertyWrapper` break the codable parsing structure,
/// WrapperCodable enables proper parsing of properties that are modified by the `PropertyWrapper`

public typealias WrapperCodable = WrapperEncodable & WrapperDecodable

public protocol WrapperEncodable: Encodable {
    associatedtype Value : Encodable
    
    var wrappedValue: Value { get set }
    
    init(wrappedValue: Value)
}

extension WrapperEncodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(wrappedValue)
    }
}

public protocol WrapperDecodable: Decodable {
    associatedtype Value : Decodable
    
    var wrappedValue: Value { get set }
    
    init(wrappedValue: Value)
}


extension WrapperDecodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let value = try container.decode(Value.self)
        self.init(wrappedValue: value)
    }
}
