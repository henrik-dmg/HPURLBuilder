import Foundation
import Testing

@testable import HPURLBuilder

@Suite
struct URLQueryItemBuilderTests {

    @Test
    func testURL() throws {
        let url = try URL.buildThrowing {
            Host("api.openweathermap.org")
            PathComponent("data")
            PathComponent("2.5")
            PathComponent("onecall")
            QueryItem(name: "lat", value: 48.123123012, digits: 5)
            QueryItem(name: "lon", value: -12.9123001299, digits: 5)
            QueryItem(name: "appid", value: "apiKey")
            QueryItem(name: "units", value: "metric")
        }

        #expect(
            url.absoluteString == "https://api.openweathermap.org/data/2.5/onecall?lat=48.12312&lon=-12.91230&appid=apiKey&units=metric"
        )
    }

    @Test
    func testNilArrayItem() throws {
        let numbers: [Int]? = [1, 61, 34, 89]
        let url = try URL.buildThrowing {
            Host("panhans.dev")
            QueryItem(name: "test", values: numbers)
        }

        #expect(url.absoluteString == "https://panhans.dev?test=1,61,34,89")
    }

    @Test
    func testArrayNilItems() throws {
        let numbers: [Int?] = [1, 34, nil, 89, nil]
        let url = try URL.buildThrowing {
            Host("panhans.dev")
            QueryItem(name: "test", values: numbers)
        }

        #expect(url.absoluteString == "https://panhans.dev?test=1,34,89")
    }

    @Test
    func testNilArrayNilItems() throws {
        let numbers: [Int?]? = [9, 34, nil, 56, nil]
        let url = try URL.buildThrowing {
            Host("panhans.dev")
            QueryItem(name: "test", values: numbers)
        }

        #expect(url.absoluteString == "https://panhans.dev?test=9,34,56")
    }

    @Test
    func testURLEncoding() throws {
        let url = try URL.buildThrowing {
            Host("panhans.dev")
            QueryItem(name: "test", value: "some string with spaces")
        }

        #expect(url.absoluteString == "https://panhans.dev?test=some%20string%20with%20spaces")
    }

    @Test
    func testBuildBasicURL() throws {
        let url = try URL.buildThrowing {
            Scheme("https")
            Host("apple.com")
            Path("/products/iphone")
            PathComponent("old")
        }

        #expect(url.absoluteString == "https://apple.com/products/iphone/old")
    }

    @Test
    func testComplexBuilder() throws {
        let token: String? = "asdasads"
        let filters: [Filter]? = [Filter(name: "firstFilter", value: "name"), Filter(name: "secondFilter", value: "lastName")]

        let url = try URL.buildThrowing {
            Host("apple.com")
            PathComponent("some/path")
            QueryItem(name: "print", value: "silent")

            ForEach(filters) { filter in
                QueryItem(name: filter.name, value: filter.value)
            }

            QueryItem(name: "auth", value: token)
        }

        let unwrappedToken = try #require(token)

        #expect(
            url.absoluteString == "https://apple.com/some/path?print=silent&firstFilter=name&secondFilter=lastName&auth=\(unwrappedToken)"
        )
    }

    @Test
    func testIfLet() throws {
        let name: String? = "John"
        let address: String? = nil
        let url = try URL.buildThrowing {
            Scheme("https")
            Host("maps.apple.com")
            if let name {
                QueryItem(name: "q", value: name)
            }
            if let address {
                QueryItem(name: "address", value: address)
            }
        }

        #expect(url.absoluteString == "https://maps.apple.com?q=John")
    }

}

private struct Filter {
    let name: String
    let value: String
}
