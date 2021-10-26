import Foundation

public extension URL {

	/// Attempts to construct a `URL` instance given the modifiers in the `modifierClosure` block. The default scheme will be set to `https`
	/// - Parameters:
	///     - prefixModifiers: an array of optional modifiers that will be executed before the elements of the `block` closure
	///     - suffixModifiers: an array of optional modifiers that will be executed after the elements of the `block` closure
	/// 	- modifierClosure: a closure that provides modifier for `URLComponents`
	/// - Returns: a `URL` instance if the modified components' `url` property is not nil
	static func build(
		prefixModifiers: [URLComponentsModifier?],
		suffixModifiers: [URLComponentsModifier?],
		@URLComponentsBuilder modifierClosure: () -> [URLComponentsModifier?]
	) -> URL? {
		var components = URLComponents()
		components.scheme = "https"
		let blocks = (prefixModifiers + modifierClosure() + suffixModifiers).compactMap { $0 }
		blocks.forEach { $0.modifyURLComponents(&components) }
		return components.url
	}

	/// Attempts to construct a `URL` instance given the modifiers in the `modifierClosure` block. The default scheme will be set to `https`
	/// - Parameters:
	/// 	- modifierClosure: a closure that provides modifier for `URLComponents`
	/// - Returns: a `URL` instance if the modified components' `url` property is not nil
	static func build(@URLComponentsBuilder modifierClosure: () -> [URLComponentsModifier?]) -> URL? {
		build(prefixModifiers: [], suffixModifiers: [], modifierClosure: modifierClosure)
	}

	/// Attempts to construct a `URL` instance given the modifiers in the `modifierClosure` block. The default scheme will be set to `https`
	/// - Parameters:
	///     - prefixModifiers: an array of optional modifiers that will be executed before the elements of the `block` closure
	///     - suffixModifiers: an array of optional modifiers that will be executed after the elements of the `block` closure
	/// 	- modifierClosure: a closure that provides modifier for `URLComponents`
	/// - Returns: a `URL` instance if the modified components' `url` property is not nil
	static func buildThrowing(
		prefixModifiers: [URLComponentsModifier?],
		suffixModifiers: [URLComponentsModifier?],
		@URLComponentsBuilder modifierClosure: () -> [URLComponentsModifier?]
	) throws -> URL {
		guard let url = build(prefixModifiers: prefixModifiers, suffixModifiers: suffixModifiers, modifierClosure: modifierClosure) else {
			throw NSError.urlBuilderFailed
		}
		return url
	}

	/// Attempts to construct a `URL` instance given the modifiers in the `modifierClosure` block. The default scheme will be set to `https`
	/// - Parameters:
	/// 	- modifierClosure: a closure that provides modifier for `URLComponents`
	/// - Returns: a `URL` instance if the modified components' `url` property is not nil
	static func buildThrowing(@URLComponentsBuilder modifierClosure: () -> [URLComponentsModifier?]) throws -> URL {
		try buildThrowing(prefixModifiers: [], suffixModifiers: [], modifierClosure: modifierClosure)
	}

}
