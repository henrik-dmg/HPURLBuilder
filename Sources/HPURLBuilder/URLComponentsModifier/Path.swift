import Foundation

/// A type that modifies the path of a given `URLComponents` instance.
public struct Path: URLComponentsModifier {

    let path: String

    /// Initialises a new instance of `Path` that will set the `path` property of `URLComponents` to the specified value.
    /// - Parameter path: the desired path
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
