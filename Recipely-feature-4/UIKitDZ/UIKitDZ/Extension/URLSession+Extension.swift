// URLSession+Extension.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

extension URLSession {
    func dataTask(
        with request: URLRequest,
        handler: @escaping (Result<Data, SessionError>) -> Void
    ) -> URLSessionDataTask {
        dataTask(with: request) { data, _, error in
            if error != nil {
                handler(.failure(.networkFailure))
            }
            guard let safeData = data else { return }
            handler(.success(safeData))
        }
    }
}

/// Кастомный еррор для обработки ошибок URLSession
public enum SessionError: Error {
    case networkFailure
    case invalidStatusCode
}
