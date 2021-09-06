import Foundation

/// A result builder that can be used to provide `URLComponentsModifier`
@resultBuilder public struct URLComponentsBuilder {

	public static func buildBlock(_ components: URLComponentsModifier?...) -> [URLComponentsModifier?] {
		components
	}

	public static func buildEither(first component: [URLComponentsModifier?]?) -> [URLComponentsModifier?] {
		component ?? []
	}

	public static func buildEither(second component: [URLComponentsModifier?]?) -> [URLComponentsModifier?] {
		component ?? []
	}

	public static func buildOptional(_ component: [URLComponentsModifier?]?) -> [URLComponentsModifier?] {
		component ?? []
	}

	public static func buildArray(_ components: [[URLComponentsModifier?]]) -> [URLComponentsModifier?] {
		components.reduce([URLComponentsModifier?]()) { partialResult, array in
			var new = partialResult
			new.append(contentsOf: array)
			return new
		}
	}

}
