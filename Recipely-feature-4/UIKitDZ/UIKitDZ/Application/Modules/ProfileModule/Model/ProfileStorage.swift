// ProfileStorage.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Хранилище данных о профиле
struct ProfileStorage {
    // MARK: - Constants

    enum Constants {
        static let avatarImageName = "profileAvatarImage"
        static let defaultUsername = "Surname Name"
        static let bonusesImageName = "starImage"
        static let privacyImageName = "paperImage"
        static let logoutImageName = "logoutImage"
        static let partnersImageName = "partnersImage"
    }

    // Данные для заполнения ячейки с информацией о пользователе
    let userInfo = UserInfo(
        imageName: Constants.avatarImageName,
        username: Local.profileModule
    )

    // Данные для ячейки с бонусами
    let bonuses =
        ProfileOption(optionImageName: Constants.bonusesImageName, optionText: Local.ProfileModule.bonusesText)

    // Данные для ячейки с политикой конфиденциальности
    let privacy = ProfileOption(
        optionImageName: Constants.privacyImageName,
        optionText: Local.ProfileModule.privacyText
    )

    // Данные для ячейки с политикой конфиденциальности
    let partners = ProfileOption(
        optionImageName: Constants.partnersImageName,
        optionText: Local.ProfileModule.partnersText
    )

    // Данные для ячейки с бонусами
    let logout = ProfileOption(optionImageName: Constants.logoutImageName, optionText: Local.ProfileModule.logoutText)

    static func fetchInfo() -> ProfileStorage {
        ProfileStorage()
    }
}
