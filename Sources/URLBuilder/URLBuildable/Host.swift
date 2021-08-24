import Foundation

public struct Host: URLBuildable {

	let host: String

	public init?(_ host: String?) {
		guard let host = host else {
			return nil
		}
		self.host = host
	}

	public func modifyURLComponents(_ components: inout URLComponents) {
		components.host = host
	}

}
