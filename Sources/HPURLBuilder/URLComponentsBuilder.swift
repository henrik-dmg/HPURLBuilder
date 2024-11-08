import Foundation

/// A result builder that can be used to provide `URLComponentsModifier`.
@resultBuilder public struct URLComponentsBuilder {

    public static func buildBlock(_ components: [URLComponentsModifier?]...) -> [URLComponentsModifier?] {
        components.flatMap { $0 }
    }

    public static func buildExpression(_ expression: URLComponentsModifier?) -> [URLComponentsModifier?] {
        [expression]
    }

    public static func buildExpression(_ expression: [URLComponentsModifier?]) -> [URLComponentsModifier?] {
        expression
    }

    public static func buildOptional(_ components: [URLComponentsModifier?]?) -> [URLComponentsModifier?] {
        components ?? []
    }

    public static func buildEither(first components: [URLComponentsModifier?]) -> [URLComponentsModifier?] {
        components
    }

    public static func buildEither(second components: [URLComponentsModifier?]) -> [URLComponentsModifier?] {
        components
    }

    static func buildArray(_ components: [[URLComponentsModifier?]]) -> [URLComponentsModifier?] {
        components.flatMap { $0 }
    }

    static func buildLimitedAvailability(_ components: [URLComponentsModifier?]) -> [URLComponentsModifier?] {
        components
    }

}
