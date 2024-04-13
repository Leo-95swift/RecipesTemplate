// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum Local {
  /// Favorites
  internal static let favoritesModule = Local.tr("Localizable", "FavoritesModule", fallback: "Favorites")
  /// Profile
  internal static let profileModule = Local.tr("Localizable", "ProfileModule", fallback: "Profile")
  /// Recipes
  internal static let recipesModule = Local.tr("Localizable", "RecipesModule", fallback: "Recipes")
  internal enum AuthModule {
    /// Incorrect format
    internal static let emailWarning = Local.tr("Localizable", "AuthModule.emailWarning", fallback: "Incorrect format")
    /// Please check the accuracy of the
    /// entered credentials
    internal static let loginError = Local.tr("Localizable", "AuthModule.loginError", fallback: "Please check the accuracy of the\nentered credentials")
    /// You entered the wrong password
    internal static let passwordWarning = Local.tr("Localizable", "AuthModule.passwordWarning", fallback: "You entered the wrong password")
    internal enum EmailLabel {
      /// Email Address
      internal static let title = Local.tr("Localizable", "AuthModule.emailLabel.title", fallback: "Email Address")
    }
    internal enum EmailTextField {
      /// Enter Email Address
      internal static let placeholder = Local.tr("Localizable", "AuthModule.emailTextField.placeholder", fallback: "Enter Email Address")
    }
    internal enum LoginButton {
      /// Login
      internal static let text = Local.tr("Localizable", "AuthModule.loginButton.text", fallback: "Login")
    }
    internal enum Main {
      /// Localizable.strings
      ///   UIKitDZ
      /// 
      ///   Created by Kostya Khvan on 29.03.2024.
      internal static let title = Local.tr("Localizable", "AuthModule.main.title", fallback: "Login")
    }
    internal enum PasswordLabel {
      /// Password
      internal static let title = Local.tr("Localizable", "AuthModule.passwordLabel.title", fallback: "Password")
    }
    internal enum PasswordTextField {
      /// Enter Password
      internal static let placeholder = Local.tr("Localizable", "AuthModule.passwordTextField.placeholder", fallback: "Enter Password")
    }
  }
  internal enum FavoritesModule {
    /// Add interesting recipes to make ordering products
    /// convenient
    internal static let favoriteRecipesSuggestionText = Local.tr("Localizable", "FavoritesModule.favoriteRecipesSuggestionText", fallback: "Add interesting recipes to make ordering products\nconvenient")
    /// There's nothing here yet
    internal static let noFavoriteRecipesText = Local.tr("Localizable", "FavoritesModule.noFavoriteRecipesText", fallback: "There's nothing here yet")
  }
  internal enum ProfileModule {
    /// Bonuses
    internal static let bonusesText = Local.tr("Localizable", "ProfileModule.bonusesText", fallback: "Bonuses")
    /// Cancel
    internal static let canAction = Local.tr("Localizable", "ProfileModule.canAction", fallback: "Cancel")
    /// Are you sure you want to
    /// log out?
    internal static let logoutAlertTitle = Local.tr("Localizable", "ProfileModule.logoutAlertTitle", fallback: "Are you sure you want to\nlog out?")
    /// Logout
    internal static let logoutText = Local.tr("Localizable", "ProfileModule.logoutText", fallback: "Logout")
    /// Ok
    internal static let okAction = Local.tr("Localizable", "ProfileModule.okAction", fallback: "Ok")
    /// Our Partners
    internal static let partnersText = Local.tr("Localizable", "ProfileModule.partnersText", fallback: "Our Partners")
    /// Terms & Privacy Policy
    internal static let privacyText = Local.tr("Localizable", "ProfileModule.privacyText", fallback: "Terms & Privacy Policy")
    /// Change your name and surname
    internal static let usernameAlertTitle = Local.tr("Localizable", "ProfileModule.usernameAlertTitle", fallback: "Change your name and surname")
    /// Surname Name
    internal static let usernameDefaultText = Local.tr("Localizable", "ProfileModule.usernameDefaultText", fallback: "Surname Name")
  }
  internal enum RecipeModule {
    /// Chicken
    internal static let chickenCategory = Local.tr("Localizable", "RecipeModule.chickenCategory", fallback: "Chicken")
    /// Desserts
    internal static let dessertsCategory = Local.tr("Localizable", "RecipeModule.dessertsCategory", fallback: "Desserts")
    /// Drinks
    internal static let drinksCategory = Local.tr("Localizable", "RecipeModule.drinksCategory", fallback: "Drinks")
    /// Fish
    internal static let fishCategory = Local.tr("Localizable", "RecipeModule.fishCategory", fallback: "Fish")
    /// Meat
    internal static let meatCategory = Local.tr("Localizable", "RecipeModule.meatCategory", fallback: "Meat")
    /// Pancake
    internal static let pancakeCategory = Local.tr("Localizable", "RecipeModule.pancakeCategory", fallback: "Pancake")
    /// Salad
    internal static let saladCategory = Local.tr("Localizable", "RecipeModule.saladCategory", fallback: "Salad")
    /// Side dish
    internal static let sideDishCategory = Local.tr("Localizable", "RecipeModule.sideDishCategory", fallback: "Side dish")
    /// Soup
    internal static let soupCategory = Local.tr("Localizable", "RecipeModule.soupCategory", fallback: "Soup")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension Local {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
