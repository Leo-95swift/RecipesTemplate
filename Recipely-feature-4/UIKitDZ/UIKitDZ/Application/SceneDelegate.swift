// SceneDelegate.swift
// Copyright © RoadMap. All rights reserved.

import Swinject
import UIKit

// swiftlint:disable all
/// SceneDelegate class
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    private var appCoordinator: AppCoordinator?
    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        setupWindow(scene: scene)
    }

    private func setupWindow(scene: UIScene) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        if let window {
            window.makeKeyAndVisible()
            let container = makeContainer()
            let builder = AppBuilder(container: container)
            appCoordinator = AppCoordinator(appBuilder: builder)
            appCoordinator?.start()
        }
    }

    private func makeContainer() -> Container {
        let container = Container()
        container.register(CoreDataService.self) { _ in CoreDataService() }.inObjectScope(.container)
        container.register(NetworkService.self) { _ in NetworkService() }.inObjectScope(.container)
        container.register(LoadImageService.self) { _ in LoadImageService() }.inObjectScope(.container)
        container.register(FileManagerService.self) { _ in FileManagerService() }.inObjectScope(.container)
        return container
    }

    private func configureInitialWindow(scene: UIScene, handler: (AppCoordinator?) -> ()) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.makeKeyAndVisible()

        let container = makeContainer()
        let builder = AppBuilder(container: container)
        appCoordinator = AppCoordinator(appBuilder: builder)
        handler(appCoordinator)
    }

    // recipes://favorites
    // recipes://profile
    // recipes://change_profile?title=kostyahwang

    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        guard let firstURL = URLContexts.first?.url,
              let components = URLComponents(url: firstURL, resolvingAgainstBaseURL: true) else { return }
        let host = components.host

        switch host {
        case "favorites":
            configureInitialWindow(scene: scene) { appCoordinator in
                appCoordinator?.openFavoritesTab()
            }
        case "profile":
            configureInitialWindow(scene: scene) { appCoordinator in
                appCoordinator?.openProfileTab()
            }
        case "change_profile":
            let queryItems = components.queryItems
            let firstQuery = queryItems?.first(where: { $0.name == "title" })
            switch firstQuery?.value {
            case "kostyahwang":
                configureInitialWindow(scene: scene) { appCoordinator in
                    appCoordinator?.changeProfile(navigationTitle: "Kostya Hwang")
                }
            default:
                configureInitialWindow(scene: scene) { appCoordinator in
                    appCoordinator?.changeProfile(navigationTitle: "My Profile")
                }
            }
        default:
            print("There is no such deeplink!!! Try again")
        }
    }
}

// swiftlint:enable all
