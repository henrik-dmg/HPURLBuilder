import Foundation

/// A type that can modify a passed in `URLComponents` instance
public protocol URLComponentsModifier {

	/// Modifies the passed in `URLComponents`
	/// - Parameters:
	/// 	- components: the components that will be modified
	func modifyURLComponents(_ components: inout URLComponents)

}
