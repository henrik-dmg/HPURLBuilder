import Foundation

/// A type that will add (or modify if existing) a query item to `URLComponents`
public struct QueryItem: URLComponentsModifier {

	let name: String
	let string: String

	/// Initialises a new instance of `QueryItem`
	/// - Parameters:
	/// 	- name: the name (or key) of the represented query item
	/// 	- value: the represented value of the query item
	public init?(name: String, value: QueryStringConvertible?) {
		guard let valueString = value?.queryItemRepresentation else {
			return nil
		}
		self.name = name
		self.string = valueString
	}

	/// Initialises a new instance of `QueryItem`
	/// - Parameters:
	/// 	- name: the name (or key) of the represented query item
	/// 	- values: an array of item represented by the query item
	public init?(name: String, values: [QueryStringConvertible?]?) {
		guard let values = values, let valueString = values.compactMap({ $0?.queryItemRepresentation }).queryItemRepresentation else {
			return nil
		}
		self.name = name
		self.string = valueString
	}

	/// Initialises a new instance of `QueryItem`
	/// - Parameters:
	/// 	- name: the name (or key) of the represented query item
	/// 	- value: the value represented by the query item
	/// 	- digits: the amount of digits the `value` parameter should be rounded to when converting to a `String`
	public init?(name: String, value: Double?, digits: Int) {
		guard let value = value else {
			return nil
		}
		self.name = name
		self.string = String(format: "%.\(digits)f", value)
	}

	public func modifyURLComponents(_ components: inout URLComponents) {
		let item = URLQueryItem(name: name, value: string)
		if var queryItems = components.queryItems, !queryItems.isEmpty {
			if let existingItemIndex = queryItems.firstIndex(where: { $0.name == self.name }) {
				queryItems[existingItemIndex] = item
			} else {
				queryItems.append(item)
			}
			components.queryItems = queryItems
		} else {
			components.queryItems = [item]
		}
	}

}
