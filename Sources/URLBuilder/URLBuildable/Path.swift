import Foundation

public struct Path: URLBuildable {

	let path: String

	public init?(_ path: String?) {
		guard let path = path else {
			return nil
		}
		self.path = path
	}

	public func modifyURLComponents(_ components: inout URLComponents) {
		components.path = path
	}

}
