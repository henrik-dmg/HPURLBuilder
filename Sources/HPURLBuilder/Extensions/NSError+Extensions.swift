import Foundation

extension NSError {

	convenience init(code: Int, description: String, domain: String) {
		let dictionary = [NSLocalizedDescriptionKey: description]
		self.init(domain: domain, code: code, userInfo: dictionary)
	}

	convenience init(code: Int, description: String) {
		self.init(code: code, description: description, package: "HPStorage")
	}

	convenience init(code: Int, description: String, package: String) {
		self.init(code: code, description: description, domain: "dev.panhans.\(package)")
	}

	static let unknown = NSError(code: 1, description: "Unknown error")
	static let urlBuilderFailed = NSError(code: 56, description: "URLBuilder failed to construct the URL")

}
