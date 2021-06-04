// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum Strings {
  /// April
  internal static let april = Strings.tr("Localizable", "april")
  /// August
  internal static let august = Strings.tr("Localizable", "august")
  /// RSD
  internal static let currency = Strings.tr("Localizable", "currency")
  /// December
  internal static let december = Strings.tr("Localizable", "december")
  /// Error
  internal static let error = Strings.tr("Localizable", "error")
  /// February
  internal static let february = Strings.tr("Localizable", "february")
  /// Something went wrong. Please try again.
  internal static let generalError = Strings.tr("Localizable", "generalError")
  /// Invalid username or password.
  internal static let invalidUsernameOrPassword = Strings.tr("Localizable", "invalidUsernameOrPassword")
  /// January
  internal static let january = Strings.tr("Localizable", "january")
  /// July
  internal static let july = Strings.tr("Localizable", "july")
  /// June
  internal static let june = Strings.tr("Localizable", "june")
  /// kg
  internal static let kilogram = Strings.tr("Localizable", "kilogram")
  /// Loading...
  internal static let loading = Strings.tr("Localizable", "loading")
  /// Logging in...
  internal static let loggingIn = Strings.tr("Localizable", "loggingIn")
  /// Login
  internal static let login = Strings.tr("Localizable", "login")
  /// Orders
  internal static let mainTabItemOrders = Strings.tr("Localizable", "mainTabItemOrders")
  /// Products
  internal static let mainTabItemProducts = Strings.tr("Localizable", "mainTabItemProducts")
  /// March
  internal static let march = Strings.tr("Localizable", "march")
  /// May
  internal static let may = Strings.tr("Localizable", "may")
  /// No products
  internal static let noProducts = Strings.tr("Localizable", "noProducts")
  /// November
  internal static let november = Strings.tr("Localizable", "november")
  /// October
  internal static let october = Strings.tr("Localizable", "october")
  /// OK
  internal static let ok = Strings.tr("Localizable", "ok")
  /// Password
  internal static let password = Strings.tr("Localizable", "password")
  /// Available quantity
  internal static let productAvailableQuantity = Strings.tr("Localizable", "productAvailableQuantity")
  /// Production date
  internal static let productDateOfProduction = Strings.tr("Localizable", "productDateOfProduction")
  /// Price
  internal static let productPricePerKilo = Strings.tr("Localizable", "productPricePerKilo")
  /// September
  internal static let september = Strings.tr("Localizable", "september")
  /// Unknown
  internal static let unknown = Strings.tr("Localizable", "unknown")
  /// Username
  internal static let username = Strings.tr("Localizable", "username")
  /// Field can't be empty
  internal static let validateMustNotBeEmpty = Strings.tr("Localizable", "validateMustNotBeEmpty")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension Strings {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
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
