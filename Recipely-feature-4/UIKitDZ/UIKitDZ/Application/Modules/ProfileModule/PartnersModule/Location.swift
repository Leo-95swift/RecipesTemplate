// Location.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import GoogleMaps

// Данные о магазинах
struct Location {
    /// Название магазина
    let title: String
    /// Адресс
    let address: String
    /// Его координаты
    let coordinate: CLLocationCoordinate2D

    static func setupData() -> [Location] {
        [
            .init(
                title: "BROSKO MARKET",
                address: "Lenina 99",
                coordinate: CLLocationCoordinate2D(latitude: 48.464895, longitude: 135.078873)
            ),
            .init(
                title: "DNS",
                address: "Lenina 51",
                coordinate: CLLocationCoordinate2D(latitude: 48.460949, longitude: 135.155434)
            ),
            .init(
                title: "CRAFT BURGER",
                address: "Lenina 45",
                coordinate: CLLocationCoordinate2D(latitude: 48.394959, longitude: 135.119499)
            ),
            .init(
                title: "MAGAZINY RADOSTI",
                address: "Leningradskaya 32",
                coordinate: CLLocationCoordinate2D(latitude: 48.429142, longitude: 135.105309)
            ),
            .init(
                title: "ARLEKIN TC",
                address: "Kim Yu Chena 12",
                coordinate: CLLocationCoordinate2D(latitude: 48.482649, longitude: 135.091347)
            ),
            .init(
                title: "MAKSI MALL",
                address: "Lenina 93",
                coordinate: CLLocationCoordinate2D(latitude: 48.414711, longitude: 135.142273)
            )
        ]
    }
}
