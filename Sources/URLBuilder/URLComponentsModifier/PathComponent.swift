import Foundation

/// A type that modifies the path of a given `URLComponents` instance
public struct PathComponent: URLComponentsModifier {

	let pathComponent: String

	/// Initialises a new instance of `PathComponent` that will append the specified value
	/// to the `path` property of `URLComponents`, separated by a slash
	/// - Parameters:
	/// 	- path: the desired path
	public init?(_ pathComponent: String?) {
		guard let pathComponent = pathComponent else {
			return nil
		}
		self.pathComponent = pathComponent
	}

	public func modifyURLComponents(_ components: inout URLComponents) {
		var pathComponents = components.path.components(separatedBy: "/")
		pathComponents.append(pathComponent)
		components.path = pathComponents.joined(separator: "/")
	}

}
