// URL+Extension.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

extension URL {
    static func makeURL(_ url: URL, mockFileName: MockFileName?) -> URL? {
        var newURL = url
        guard Constants.isMockMode else { return newURL }
        var fileName = mockFileName?.rawValue ?? ""
        if fileName.isEmpty {
            fileName = fileName.replacingOccurrences(of: "/", with: "_")
        }
        let bundleURL = Bundle.main.url(forResource: fileName, withExtension: "json")
        guard let bundleURL = bundleURL else {
            let errorText = "Отсутствует моковый файл: \(fileName).json"
            debugPrint(errorText)
            return nil
        }
        newURL = bundleURL
        print(newURL)
        return newURL
    }
}
