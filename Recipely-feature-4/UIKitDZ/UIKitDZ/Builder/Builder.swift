// Builder.swift
// Copyright © RoadMap. All rights reserved.

import Swinject
import UIKit

/// Контейнер для проставления зависимостей и сборки модулей
final class AppBuilder {
    // MARK: - Constants

    enum Constants {
        enum Images {
            static let recipes = "Recipes"
            static let favorites = "Favorites"
            static let profile = "Profile"
        }
    }

    // MARK: - Private Properties

    private let container: Container?

    // MARK: - Initializers

    init(container: Container?) {
        self.container = container
    }

    // MARK: - Public Methodes

    func makeAuthModule(coordinator: AuthCoordinator) -> AuthViewController {
        let view = AuthViewController()
        let authPresenter = AuthPresenter(view: view, coordinator: coordinator)
        view.presenter = authPresenter
        return view
    }

    func makeRecipesModule(coordinator: RecipesCoordinator) -> RecipesViewController {
        let view = RecipesViewController()
        let recipesPresenter = RecipesPresenter(view: view, coordinator: coordinator)
        view.presenter = recipesPresenter
        view.fileManagerService = container?.resolve(FileManagerService.self)
        view.tabBarItem = UITabBarItem(
            title: Local.recipesModule,
            image: UIImage(named: Constants.Images.recipes),
            tag: 0
        )
        return view
    }

    func makeDishesModule(
        coordinator: RecipesCoordinator,
        data: Category
    ) -> DishesViewController {
        let view = DishesViewController()
        let dishesPresenter = DishesPresenter(
            view: view,
            coordinator: coordinator,
            networkService: container?.resolve(NetworkService.self),
            coreDataService: container?.resolve(CoreDataService.self),
            categoty: data
        )
        view.presenter = dishesPresenter
        view.fileManagerService = container?.resolve(FileManagerService.self)
        return view
    }

    func makeDishesDetailModule(
        coordinator: RecipesCoordinator,
        data: (String, String)
    ) -> DishesDetailViewController {
        let view = DishesDetailViewController()
        let dishesDetailPresenter = DishesDetailPresenter(
            view: view,
            coordinator: coordinator,
            networkService: container?.resolve(NetworkService.self),
            coreDataService: container?.resolve(CoreDataService.self),
            data: data
        )
        view.presenter = dishesDetailPresenter
        view.fileManagerService = container?.resolve(FileManagerService.self)
        return view
    }

    func makeFavoritesModule(coordinator: FavoritesCoordinator) -> FavoritesViewController {
        let view = FavoritesViewController()
        let favoritesPresenter = FavoritesPresenter(view: view, coordinator: coordinator)
        view.presenter = favoritesPresenter
        view.fileManagerService = container?.resolve(FileManagerService.self)
        view.tabBarItem = UITabBarItem(
            title: Local.favoritesModule,
            image: UIImage(named: Constants.Images.favorites),
            tag: 1
        )
        return view
    }

    func makeProfileModule(coordinator: ProfileCoordinator) -> ProfileViewController {
        let view = ProfileViewController()
        let profilePresenter = ProfilePresenter(view: view, coordinator: coordinator)
        view.presenter = profilePresenter
        view.fileManagerService = container?.resolve(FileManagerService.self)
        view.tabBarItem = UITabBarItem(
            title: Local.profileModule,
            image: UIImage(named: Constants.Images.profile),
            tag: 2
        )
        return view
    }

    func makeBonusesModule(coordinator: BaseCoodinator) -> BonusViewController {
        let view = BonusViewController()
        let bonusesPresenter = BonusPresenter(view: view, coordinator: coordinator)
        view.presenter = bonusesPresenter
        return view
    }

    func makeTermsOfUseModule(coordinator: BaseCoodinator) -> TermsOfUseViewController {
        let view = TermsOfUseViewController()
        let termsOfUsePresenter = TermsOfUsePresenter(view: view, coordinator: coordinator)
        view.presenter = termsOfUsePresenter
        return view
    }

    func makePartnersModule(coordinator: BaseCoodinator) -> PartnersViewController {
        let view = PartnersViewController()
        let partnersPresenter = PartnersPresenter(view: view, coordinator: coordinator)
        view.presenter = partnersPresenter
        return view
    }
}
