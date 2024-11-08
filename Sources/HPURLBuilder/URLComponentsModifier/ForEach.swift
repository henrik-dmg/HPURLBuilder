import Foundation

/// A type that modifies a given `URLComponents` instance for every piece of data it receives.
public struct ForEach: URLComponentsModifier {

    let blocks: [URLComponentsModifier?]

    /// Initialises a new instance of `ForEach`.
    /// - Parameters:
    /// 	- data: the collection of data that will be passed to builder closure one by one
    /// 	- block: a closure that will be called for every instance in `data`
    public init?<T>(_ data: [T]?, @URLComponentsBuilder block: (T) -> [URLComponentsModifier?]) {
        guard let data = data, !data.isEmpty else {
            return nil
        }

        let blocks = data.map { block($0) }
        self.blocks = blocks.reduce([URLComponentsModifier?]()) { prev, arr in
            var new = prev
            new.append(contentsOf: arr)
            return new
        }
    }

    public func modifyURLComponents(_ components: inout URLComponents) {
        for block in blocks {
            block?.modifyURLComponents(&components)
        }
    }

}
