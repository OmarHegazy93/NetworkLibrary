# Networking Library

This repository contains a simple yet robust networking library written in Swift. The library provides an abstraction layer for making network requests, parsing data. The primary components of the library include protocols and classes for API management, request handling, data parsing.

## Components

### 1. `APIManagerProtocol` and `APIManager`

The `APIManagerProtocol` defines the interface for performing network requests, and the `APIManager` class provides the concrete implementation. It utilizes `URLSession` to make HTTP requests and handles various network errors.

**Key Features:**
- Handles network requests with a completion handler.
- Manages URL creation and HTTP methods.
- Handles response validation and error logging.

### 2. `NetworkError`

An enum representing different types of network errors that can occur during a network request. It conforms to `LocalizedError` to provide user-friendly error descriptions.

### 3. `RequestManagerProtocol` and `RequestManager`

The `RequestManagerProtocol` defines the interface for handling network requests and parsing the response. The `RequestManager` class implements this protocol and uses `APIManager` to perform requests and `DataParser` to parse the response data.

**Key Features:**
- Performs network requests and parses the response into a decodable object.
- Handles parsing errors and network errors.

### 4. `RequestError`

An enum representing different types of errors that can occur during a request operation, including network errors and parsing errors.

### 5. `DataParserProtocol` and `DataParser`

The `DataParserProtocol` defines the interface for parsing data into decodable objects. The `DataParser` class provides the concrete implementation using `JSONDecoder`.

**Key Features:**
- Parses JSON data into decodable objects.
- Handles parsing errors and provides detailed error descriptions.

### 6. `ParsingError`

An enum representing different types of parsing errors that can occur during data parsing.

### 7. `RequestProtocol`

The `RequestProtocol` defines the interface for a network request, including properties like path, request type, headers, parameters, and URL parameters. It also provides a default implementation for creating a `URLRequest`.

**Key Features:**
- Defines common properties for network requests.
- Provides a method to create a `URLRequest` from the defined properties.

**Key Features:**
- Provides detailed error handling and logging.

## Usage

To use this library, follow these steps:

1. **Define a Request:**
   Implement the `RequestProtocol` to create a request with specific path, headers, parameters, etc.

2. **Perform a Network Request:**
   Use `RequestManager` to perform the network request and handle the parsed response.

## Example

```swift
struct MyRequest: RequestProtocol {
    var path: String = "/my-endpoint"
    var requestType: RequestType = .get
    var headers: [String: String] = ["Authorization": "Bearer token"]
    var params: [String: Any] = [:]
    var urlParams: [String: String?] = [:]
}

struct MyModel: Codable {
    let id: String
    let name: String
}

// Performing a request
let requestManager = RequestManager()
let request = MyRequest()
requestManager.perform(request) { (result: Result<MyModel, RequestError>) in
    switch result {
    case .success(let model):
        print("Model: \(model)")
    case .failure(let error):
        print("Error: \(error.localizedDescription)")
    }
}
