//
//  RequestError.swift
//  
//
//  Created by Omar Hegazy on 21/05/2024.
//

public enum RequestError: Error {
    case networkError(NetworkError)
    case parsingError(ParsingError)
}
