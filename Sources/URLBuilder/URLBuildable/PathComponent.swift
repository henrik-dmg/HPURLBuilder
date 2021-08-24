import Foundation

public struct PathComponent: URLBuildable {

	let pathComponent: String

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
