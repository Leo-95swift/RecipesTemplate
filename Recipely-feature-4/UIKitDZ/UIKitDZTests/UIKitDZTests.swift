// UIKitDZTests.swift
// Copyright © RoadMap. All rights reserved.

@testable import UIKitDZ
import XCTest

final class UIKitDZTests: XCTestCase {
    var dishCategory: DishType = .drinks
    var networkService: NetworkServiceProtocol!
    var uri: String!

    override func setUpWithError() throws {
        networkService = NetworkService()
        uri = "http://www.edamam.com/ontologies/edamam.owl#recipe_5b680f6222d648548996ffd08b0486a0"
    }

    override func tearDownWithError() throws {
        networkService = nil
    }

    func testNetworkRequestForDishes() {
        let expectation = self.expectation(description: "Fetching dishes")
        networkService.getDishes(dishType: dishCategory.rawValue) { result in
            switch result {
            case let .success(dishes):
                XCTAssert(!dishes.isEmpty)
                expectation.fulfill()
            case .failure(.networkFailure), .failure(.invalidStatusCode):
                XCTFail("Ожидался успешный результат, получена ошибка")
                expectation.fulfill()
            }
        }
        wait(for: [expectation])
    }

    func testNetworkRequestForDishDetails() {
        let expectation = self.expectation(description: "Fetching dish details")
        networkService.getDishesDetail(uri) { result in
            switch result {
            case let .success(dishDetail):
                XCTAssert(!dishDetail.label.isEmpty)
                expectation.fulfill()
            case .failure(.networkFailure), .failure(.invalidStatusCode):
                XCTFail("Ошибка получения детального блюда")
                expectation.fulfill()
            }
        }
        wait(for: [expectation])
    }
}
