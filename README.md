# DataSnapshotDecoder

Use Swift's `Decodable` with Firebase Realtime Database's `DataSnapshot`.

Say you have:

```swift
import Foundation

struct CoolData: Decodable {
    let hasBindle: Bool
    let interestingItemCount: Int
}
```

then you can get your list of cool data by:

```swift
import FirebaseDatabase

let observer: DataSnapshot -> Void = { snapshot in
    let cools = try! DataSnapshotDecoder().decode([CoolData].self, from: snapshot)
    print("decoded cools! \(cools)")
}

Database.database().reference(withPath: "/cools").observe(.value, with: observer)
```

No need to round-trip through JSON or manually extract values from the `DataSnapshot`. All the goodness of `Decodable` direct from your Firebase Realtime Database. Nested objects, arrays, optionals, it's all there.

`DataSnapshotDecoder` is an example of a nontrivial, yet straightforward, custom implementation of `Foundation.Decoder`. If you're navigating that protocol, maybe this example is helpful!

## Install

### Using CocoaPods

You'll need CocoaPods 1.4 or greater because we depend on `FirebaseDatabase`, a static framework.

1. Add `pod 'DataSnapshotDecoder` to your `Podfile`.
2. Do a `pod install`.

Then you'll need to `import DataSnapshotDecoder` in any `.swift` files where you wish to use it.

### Manually

Assuming you already have the `FirebaseDatabase` framework set up:

1. Download [DataSnapshotDecoder.swift](DataSnapshotDecoder.swift). (This is a single-file "library" so this is all you need!)
    * Or add this repository as a git submodule (or equivalent), if you prefer.
2. Drag `DataSnapshotDecoder.swift` into your Xcode project.

## Contribute

Issues and/or pull requests are welcome! Also feel free to email us: hello@mindsea.com.

## Fun facts

Need access to your database object's `key` and/or `priority`? No problem:

```swift
struct CoolKeyedData: Decodable {
    let key: String
    let hasBindle: Bool
    let priority: String?
    
    private enum CodingKeys: String, CodingKey {
        case key = ".key"
        case hasBindle
        case priority = ".priority"
    }
}
```
