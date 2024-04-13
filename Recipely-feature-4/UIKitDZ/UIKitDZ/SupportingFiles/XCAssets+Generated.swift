// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif
#if canImport(SwiftUI)
  import SwiftUI
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ColorAsset.Color", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetColorTypeAlias = ColorAsset.Color
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum AssetImage {
  internal static let accentColor = ColorAsset(name: "AccentColor")
  internal static let emailIcon = ImageAsset(name: "emailIcon")
  internal static let passwordIcon = ImageAsset(name: "passwordIcon")
  internal static let passwordInvisible = ImageAsset(name: "passwordInvisible")
  internal static let passwordVisible = ImageAsset(name: "passwordVisible")
  internal static let chicken1 = ImageAsset(name: "chicken1")
  internal static let chicken2 = ImageAsset(name: "chicken2")
  internal static let chicken3 = ImageAsset(name: "chicken3")
  internal static let chicken4 = ImageAsset(name: "chicken4")
  internal static let chicken5 = ImageAsset(name: "chicken5")
  internal static let chicken6 = ImageAsset(name: "chicken6")
  internal static let chicken7 = ImageAsset(name: "chicken7")
  internal static let chicken8 = ImageAsset(name: "chicken8")
  internal static let chicken9 = ImageAsset(name: "chicken9")
  internal static let dessert1 = ImageAsset(name: "dessert1")
  internal static let dessert2 = ImageAsset(name: "dessert2")
  internal static let dessert3 = ImageAsset(name: "dessert3")
  internal static let dessert4 = ImageAsset(name: "dessert4")
  internal static let dessert5 = ImageAsset(name: "dessert5")
  internal static let dessert6 = ImageAsset(name: "dessert6")
  internal static let dessert7 = ImageAsset(name: "dessert7")
  internal static let dessert8 = ImageAsset(name: "dessert8")
  internal static let dessert9 = ImageAsset(name: "dessert9")
  internal static let drink1 = ImageAsset(name: "drink1")
  internal static let drink2 = ImageAsset(name: "drink2")
  internal static let drink3 = ImageAsset(name: "drink3")
  internal static let drink4 = ImageAsset(name: "drink4")
  internal static let drink5 = ImageAsset(name: "drink5")
  internal static let drink6 = ImageAsset(name: "drink6")
  internal static let drink7 = ImageAsset(name: "drink7")
  internal static let drink8 = ImageAsset(name: "drink8")
  internal static let drink9 = ImageAsset(name: "drink9")
  internal static let fish1 = ImageAsset(name: "fish1")
  internal static let fish2 = ImageAsset(name: "fish2")
  internal static let fish3 = ImageAsset(name: "fish3")
  internal static let fish4 = ImageAsset(name: "fish4")
  internal static let fish5 = ImageAsset(name: "fish5")
  internal static let fish6 = ImageAsset(name: "fish6")
  internal static let fish7 = ImageAsset(name: "fish7")
  internal static let fish8 = ImageAsset(name: "fish8")
  internal static let fish9 = ImageAsset(name: "fish9")
  internal static let meat1 = ImageAsset(name: "meat1")
  internal static let meat2 = ImageAsset(name: "meat2")
  internal static let meat3 = DataAsset(name: "meat3")
  internal static let meat4 = ImageAsset(name: "meat4")
  internal static let meat5 = ImageAsset(name: "meat5")
  internal static let meat6 = ImageAsset(name: "meat6")
  internal static let meat7 = ImageAsset(name: "meat7")
  internal static let meat8 = ImageAsset(name: "meat8")
  internal static let meat9 = DataAsset(name: "meat9")
  internal static let pancake1 = ImageAsset(name: "pancake1")
  internal static let pancake2 = ImageAsset(name: "pancake2")
  internal static let pancake3 = ImageAsset(name: "pancake3")
  internal static let pancake4 = ImageAsset(name: "pancake4")
  internal static let pancake5 = ImageAsset(name: "pancake5")
  internal static let pancake6 = ImageAsset(name: "pancake6")
  internal static let pancake7 = ImageAsset(name: "pancake7")
  internal static let pancake8 = ImageAsset(name: "pancake8")
  internal static let pancake9 = ImageAsset(name: "pancake9")
  internal static let salad1 = ImageAsset(name: "salad1")
  internal static let salad2 = ImageAsset(name: "salad2")
  internal static let salad3 = ImageAsset(name: "salad3")
  internal static let salad4 = ImageAsset(name: "salad4")
  internal static let salad5 = DataAsset(name: "salad5")
  internal static let salad6 = ImageAsset(name: "salad6")
  internal static let salad7 = ImageAsset(name: "salad7")
  internal static let salad8 = ImageAsset(name: "salad8")
  internal static let salad9 = DataAsset(name: "salad9")
  internal static let sidedish1 = ImageAsset(name: "sidedish1")
  internal static let sidedish2 = ImageAsset(name: "sidedish2")
  internal static let sidedish3 = ImageAsset(name: "sidedish3")
  internal static let sidedish4 = DataAsset(name: "sidedish4")
  internal static let sidedish5 = ImageAsset(name: "sidedish5")
  internal static let sidedish6 = ImageAsset(name: "sidedish6")
  internal static let sidedish7 = ImageAsset(name: "sidedish7")
  internal static let sidedish8 = ImageAsset(name: "sidedish8")
  internal static let sidedish9 = ImageAsset(name: "sidedish9")
  internal static let soup1 = ImageAsset(name: "soup1")
  internal static let soup2 = ImageAsset(name: "soup2")
  internal static let soup3 = ImageAsset(name: "soup3")
  internal static let soup4 = ImageAsset(name: "soup4")
  internal static let soup5 = ImageAsset(name: "soup5")
  internal static let soup6 = ImageAsset(name: "soup6")
  internal static let soup7 = ImageAsset(name: "soup7")
  internal static let soup8 = ImageAsset(name: "soup8")
  internal static let soup9 = ImageAsset(name: "soup9")
  internal static let arrow = ImageAsset(name: "arrow")
  internal static let lightStackNormal = ImageAsset(name: "lightStackNormal")
  internal static let lightStackVertical = ImageAsset(name: "lightStackVertical")
  internal static let nothingFoundIcon = ImageAsset(name: "nothingFoundIcon")
  internal static let pizza = ImageAsset(name: "pizza")
  internal static let stack = ImageAsset(name: "stack")
  internal static let dish1 = ImageAsset(name: "dish1")
  internal static let dish2 = ImageAsset(name: "dish2")
  internal static let dish3 = ImageAsset(name: "dish3")
  internal static let dish4 = ImageAsset(name: "dish4")
  internal static let dish5 = ImageAsset(name: "dish5")
  internal static let dish6 = ImageAsset(name: "dish6")
  internal static let addToFavorites = ImageAsset(name: "addToFavorites")
  internal static let backButton = ImageAsset(name: "backButton")
  internal static let cookTimeIcon = ImageAsset(name: "cookTimeIcon")
  internal static let shareButton = ImageAsset(name: "shareButton")
  internal static let totalWightIcon = ImageAsset(name: "totalWightIcon")
  internal static let lightningImage = ImageAsset(name: "lightningImage")
  internal static let reloadImage = ImageAsset(name: "reloadImage")
  internal static let isFavoriteNotSelected = ImageAsset(name: "isFavoriteNotSelected")
  internal static let isFavoriteSelected = ImageAsset(name: "isFavoriteSelected")
  internal static let noFavoritesIcon = ImageAsset(name: "noFavoritesIcon")
  internal static let bluePin = ImageAsset(name: "bluePin")
  internal static let box = ImageAsset(name: "box")
  internal static let goldenStar = ImageAsset(name: "goldenStar")
  internal static let locationButtonBlack = ImageAsset(name: "locationButtonBlack")
  internal static let locationButtonClear = ImageAsset(name: "locationButtonClear")
  internal static let logoutImage = ImageAsset(name: "logoutImage")
  internal static let paperImage = ImageAsset(name: "paperImage")
  internal static let partnersImage = ImageAsset(name: "partnersImage")
  internal static let pencil = ImageAsset(name: "pencil")
  internal static let profileAvatarImage = ImageAsset(name: "profileAvatarImage")
  internal static let redPin = ImageAsset(name: "redPin")
  internal static let starImage = ImageAsset(name: "starImage")
  internal static let chicken = ImageAsset(name: "chicken")
  internal static let desserts = ImageAsset(name: "desserts")
  internal static let drinks = ImageAsset(name: "drinks")
  internal static let fish = ImageAsset(name: "fish")
  internal static let meat = ImageAsset(name: "meat")
  internal static let pancakes = ImageAsset(name: "pancakes")
  internal static let salad = ImageAsset(name: "salad")
  internal static let sideDish = ImageAsset(name: "sideDish")
  internal static let soup = ImageAsset(name: "soup")
  internal static let favorites = ImageAsset(name: "Favorites")
  internal static let profile = ImageAsset(name: "Profile")
  internal static let recipes = ImageAsset(name: "Recipes")
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal final class ColorAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  internal private(set) lazy var color: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  #if os(iOS) || os(tvOS)
  @available(iOS 11.0, tvOS 11.0, *)
  internal func color(compatibleWith traitCollection: UITraitCollection) -> Color {
    let bundle = BundleToken.bundle
    guard let color = Color(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }
  #endif

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  internal private(set) lazy var swiftUIColor: SwiftUI.Color = {
    SwiftUI.Color(asset: self)
  }()
  #endif

  fileprivate init(name: String) {
    self.name = name
  }
}

internal extension ColorAsset.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
internal extension SwiftUI.Color {
  init(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle)
  }
}
#endif

internal struct DataAsset {
  internal fileprivate(set) var name: String

  @available(iOS 9.0, tvOS 9.0, watchOS 6.0, macOS 10.11, *)
  internal var data: NSDataAsset {
    guard let data = NSDataAsset(asset: self) else {
      fatalError("Unable to load data asset named \(name).")
    }
    return data
  }
}

@available(iOS 9.0, tvOS 9.0, watchOS 6.0, macOS 10.11, *)
internal extension NSDataAsset {
  convenience init?(asset: DataAsset) {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS) || os(watchOS)
    self.init(name: asset.name, bundle: bundle)
    #elseif os(macOS)
    self.init(name: NSDataAsset.Name(asset.name), bundle: bundle)
    #endif
  }
}

internal struct ImageAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Image = UIImage
  #endif

  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, macOS 10.7, *)
  internal var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }

  #if os(iOS) || os(tvOS)
  @available(iOS 8.0, tvOS 9.0, *)
  internal func image(compatibleWith traitCollection: UITraitCollection) -> Image {
    let bundle = BundleToken.bundle
    guard let result = Image(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
  #endif

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  internal var swiftUIImage: SwiftUI.Image {
    SwiftUI.Image(asset: self)
  }
  #endif
}

internal extension ImageAsset.Image {
  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, *)
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init?(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
internal extension SwiftUI.Image {
  init(asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle)
  }

  init(asset: ImageAsset, label: Text) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle, label: label)
  }

  init(decorative asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(decorative: asset.name, bundle: bundle)
  }
}
#endif

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
