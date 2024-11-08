import Foundation

/// A type that modifies the scheme of a given `URLComponents` instance.
public struct Scheme: URLComponentsModifier {

    let scheme: String

    /// Initialises a new instance of `Scheme` that will set the `scheme` property of `URLComponents` to the specified value.
    /// - Parameter scheme: the desired scheme
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
