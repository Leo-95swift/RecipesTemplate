// AuthCoordinator.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Координатор авторизации
final class AuthCoordinator: BaseCoodinator {
    // MARK: - Public Properties

    var onFinishFlow: VoidHandler?
    var rootController: UINavigationController?

    // MARK: - Private Properties

    private let builder: AppBuilder

    init(builder: AppBuilder) {
        self.builder = builder
    }

    // MARK: - Public Methods

    func setViewController(controller: UIViewController) {
        rootController = UINavigationController(rootViewController: controller)
    }

    func moveToMain() {
        onFinishFlow?()
    }
}
