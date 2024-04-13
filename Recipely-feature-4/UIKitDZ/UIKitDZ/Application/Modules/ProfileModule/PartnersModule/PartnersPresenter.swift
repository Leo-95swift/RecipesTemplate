// PartnersPresenter.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

// BonusPresenter.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Интерфейс взаимодействия c презентером
protocol PartnersPresenterProtocol {
    /// Сообщает вью, что нужно закрыть экран
    func closeScreen()
    /// Показывает информацию о марке
    func loadInfoFromMark(info: Location)
}

/// Презентер для экрана с бонусов
final class PartnersPresenter {
    // MARK: - Private Properties

    private weak var view: PartnersViewControllerProtocol?
    private weak var coordinator: BaseCoodinator?

    // MARK: - Initializers

    init(view: PartnersViewControllerProtocol, coordinator: BaseCoodinator) {
        self.view = view
        self.coordinator = coordinator
    }
}

// MARK: - BonusPresenter + BonusPresenterProtocol

extension PartnersPresenter: PartnersPresenterProtocol {
    func closeScreen() {
        view?.closeScreen()
    }

    func loadInfoFromMark(info: Location) {
        view?.openInfoAdress(info: info)
    }
}
