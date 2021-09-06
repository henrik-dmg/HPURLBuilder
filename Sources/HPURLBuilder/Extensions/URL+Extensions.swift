import Foundation

public extension URL {

	/// Attempts to construct a `URL` instance given the modifiers in the `block` closure. The default scheme will be set to `https`
	/// - Parameter block: a closure that provides modifier for `URLComponents`
	/// - Returns: a `URL` instance if the modified components' `url` property is not nil
	static func build(@URLComponentsBuilder block: () -> [URLComponentsModifier?]) -> URL? {
		var components = URLComponents()
		components.scheme = "https"
		let blocks = block().compactMap { $0 }
		blocks.forEach { $0.modifyURLComponents(&components) }
		return components.url
	}

	/// Attempts to construct a `URL` instance given the modifiers in the `block` closure. The default scheme will be set to `https`
	/// - Parameter block: a closure that provides modifier for `URLComponents`
	/// - Returns: a `URL` instance if the modified components' `url` property is not nil
	static func buildThrowing(@URLComponentsBuilder block: () -> [URLComponentsModifier?]) throws -> URL {
		guard let url = build(block: block) else {
			throw NSError.urlBuilderFailed
		}
		return url
	}

}
