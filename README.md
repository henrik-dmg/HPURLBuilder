# URLBuilder

A library to construct URLs with an elegant, SwiftUI-like syntax.

## Installation

### SPM

Either add `.package(url: "https://github.com/henrik-dmg/URLBuilder", from: "1.0.0")` to your `Package.swift` file or add a new Swift package from the Xcode project navigator

### CocoaPods

TODO

## Usage

`URLBuilder` offers you two `URL` extensions to build a URL:

```swift
let constructedURL: URL = try URL.buildThrowing {
    Host("panhans.dev")
    Path("opensource/urlbuilder/index.html")
}

let anotherURL: URL? = URL.build {
    Host("panhans.dev")
    PathComponent("opensource")
    PathComponent("urlbuilder")
    if someConditionIsTrue {
        QueryItem(name: "focus-search", value: true)
    }
}
```

### URLComponentsModifier

#### Scheme

Modifies the `scheme` property of `URLComponents`

#### Host

Modifies the `host` property of `URLComponents`

#### Path

Modifies the `path` property of `URLComponents`

#### PathComponent

Appends its value to the `path` property of `URLComponents`, separated by a `/`

#### QueryItem

Appends or modifies a query item in the `queryItems` property of `URLComponents`

#### ForEach

Can be used to provide modifiers for a collection of data

##### Example

Let's say we want to add some filters to a imaginary search query. We could define a rudimentary filter type like this:

```swift
struct SearchFilter {
    let name: String
    let value: String
}
```

We can then use an array of such filters with `ForEach` like this:

```swift
let filtersToApply = [SearchFilter(name: "location", value: "Berlin", SearchFilter(name: "radius", value: "10")]

URL.build {
    ForEach(filtersToApply) { filter in
        QueryItem(name: filter.name, value: filter.value)
    }
}

```

## Authors

- Henrik Panhans ([@henrik_dmg](https://twitter.com/henrik_dmg))
