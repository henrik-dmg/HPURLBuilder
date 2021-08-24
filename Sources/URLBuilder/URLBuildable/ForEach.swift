import Foundation

public struct ForEach: URLBuildable {

	let blocks: [URLBuildable?]

	public init?<T>(_ data: [T]?, @URLComponentsBuilder block: (T) -> [URLBuildable?]) {
		guard let data = data, !data.isEmpty else {
			return nil
		}

		let blocks = data.map { block($0) }
		self.blocks = blocks.reduce([URLBuildable?]()) { prev, arr in
			var new = prev
			new.append(contentsOf: arr)
			return new
		}
	}

	public func modifyURLComponents(_ components: inout URLComponents) {
		blocks.forEach {
			$0?.modifyURLComponents(&components)
		}
	}

}
