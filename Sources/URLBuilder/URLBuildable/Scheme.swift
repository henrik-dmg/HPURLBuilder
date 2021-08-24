import Foundation

public struct Scheme: URLBuildable {

	let scheme: String

	public init?(_ scheme: String?) {
		guard let scheme = scheme else {
			return nil
		}
		self.scheme = scheme
	}

	public func modifyURLComponents(_ components: inout URLComponents) {
		components.scheme = scheme
	}

}
