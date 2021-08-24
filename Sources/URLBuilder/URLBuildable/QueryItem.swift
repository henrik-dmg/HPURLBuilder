import Foundation

public struct QueryItem: URLBuildable {

	let name: String
	let string: String

	public init?(name: String, value: QueryStringConvertible?) {
		guard let value = value else {
			return nil
		}
		self.name = name
		self.string = value.queryItemRepresentation
	}

	public init?(name: String, value: Double?, digits: Int) {
		guard let value = value else {
			return nil
		}
		self.name = name
		self.string = String(format: "%.\(digits)f", value)
	}

	public init?(name: String, value: [QueryStringConvertible?]?) {
		guard let value = value, !value.isEmpty else {
			return nil
		}
		self.name = name
		self.string = value.compactMap { $0?.queryItemRepresentation }.joined(separator: ",")
	}

	public func modifyURLComponents(_ components: inout URLComponents) {
		let item = URLQueryItem(name: name, value: string)
		if components.queryItems == nil {
			components.queryItems = [item]
		} else {
			components.queryItems?.append(item)
		}
	}

}
