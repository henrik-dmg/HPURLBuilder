import Foundation

#if canImport(UIKit)
import UIKit
#endif

#if canImport(AppKit)
import AppKit
#endif

/// A type that can be represented as part of URL query item
public protocol QueryStringConvertible {

	/// The query item `String` representation of the type
	var queryItemRepresentation: String? { get }

}

public extension LosslessStringConvertible {

	/// The query item `String` representation of the type
	var queryItemRepresentation: String? { description }

}

public extension RawRepresentable where RawValue == QueryStringConvertible {

	/// The query item `String` representation of the type
	var queryItemRepresentation: String? {
		rawValue.queryItemRepresentation
	}

}

extension String: QueryStringConvertible {}
extension Bool: QueryStringConvertible {}
extension Int: QueryStringConvertible {}
extension Int64: QueryStringConvertible {}
extension Int32: QueryStringConvertible {}
extension Int16: QueryStringConvertible {}
extension Int8: QueryStringConvertible {}
extension UInt: QueryStringConvertible {}
extension UInt64: QueryStringConvertible {}
extension UInt32: QueryStringConvertible {}
extension UInt16: QueryStringConvertible {}
extension UInt8: QueryStringConvertible {}
extension Double: QueryStringConvertible {}
extension Float: QueryStringConvertible {}

extension CGFloat: QueryStringConvertible {

	public var queryItemRepresentation: String? {
		native.queryItemRepresentation
	}

}

extension URL: QueryStringConvertible {

	public var queryItemRepresentation: String? {
		absoluteString
	}

}

extension Array: QueryStringConvertible where Element == QueryStringConvertible {

	public var queryItemRepresentation: String? {
		guard !isEmpty else {
			return nil
		}
		let mappedValues = compactMap { $0.queryItemRepresentation }
		return mappedValues.joined(separator: ",").nilIfEmpty()
	}

}
