// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  internal enum Network {
    internal enum Error {
      /// Ops! aconteceu algum erro de rede.
      internal static let general = L10n.tr("Localizable", "network.error.general", fallback: "Ops! aconteceu algum erro de rede.")
    }
  }
  internal enum User {
    internal enum Authentication {
      internal enum Error {
        /// Localizable.strings
        ///   KssiusBank
        /// 
        ///   Created by Cassio Sousa on 16/06/23.
        internal static let general = L10n.tr("Localizable", "user.authentication.error.general", fallback: "Não foi possível efetuar o seu login. Por favor verifique se seu usuário e senha estão corretos e tente novamente.")
        /// Por favor informe um email ou CPF válido no campo de usuário.
        internal static let invalidCpf = L10n.tr("Localizable", "user.authentication.error.invalidCpf", fallback: "Por favor informe um email ou CPF válido no campo de usuário.")
        /// Por favor a senha precisa conter uma letra maiúscula, caracter especial e caracter alfanumérico.
        internal static let invalidPassword = L10n.tr("Localizable", "user.authentication.error.invalidPassword", fallback: "Por favor a senha precisa conter uma letra maiúscula, caracter especial e caracter alfanumérico.")
      }
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
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
