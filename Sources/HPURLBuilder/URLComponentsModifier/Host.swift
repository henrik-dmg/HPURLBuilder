import Foundation

/// A type that modifies the host of a given `URLComponents` instance.
public struct Host: URLComponentsModifier {

    let host: String

    /// Initialises a new instance of `Host` that will set the `host` property of `URLComponents` to the specified value.
    /// - Parameter host: the desired host name
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
