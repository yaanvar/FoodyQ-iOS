import Foundation
#if canImport(AppKit)
import AppKit
#endif
#if canImport(UIKit)
import UIKit
#endif
#if canImport(SwiftUI)
import SwiftUI
#endif
#if canImport(DeveloperToolsSupport)
import DeveloperToolsSupport
#endif

#if SWIFT_PACKAGE
private let resourceBundle = Foundation.Bundle.module
#else
private class ResourceBundleClass {}
private let resourceBundle = Foundation.Bundle(for: ResourceBundleClass.self)
#endif

// MARK: - Color Symbols -

@available(iOS 11.0, macOS 10.13, tvOS 11.0, *)
extension ColorResource {

    /// The "Background" asset catalog color resource.
    static let background = ColorResource(name: "Background", bundle: resourceBundle)

    /// The "Shadow" asset catalog color resource.
    static let shadow = ColorResource(name: "Shadow", bundle: resourceBundle)

    /// The "tabbar" asset catalog color resource.
    static let tabbar = ColorResource(name: "tabbar", bundle: resourceBundle)

    /// The "tabbaritem" asset catalog color resource.
    static let tabbaritem = ColorResource(name: "tabbaritem", bundle: resourceBundle)

}

// MARK: - Image Symbols -

@available(iOS 11.0, macOS 10.7, tvOS 11.0, *)
extension ImageResource {

    /// The "Background 1" asset catalog image resource.
    static let background1 = ImageResource(name: "Background 1", bundle: resourceBundle)

    /// The "Background 10" asset catalog image resource.
    static let background10 = ImageResource(name: "Background 10", bundle: resourceBundle)

    /// The "Background 2" asset catalog image resource.
    static let background2 = ImageResource(name: "Background 2", bundle: resourceBundle)

    /// The "Background 3" asset catalog image resource.
    static let background3 = ImageResource(name: "Background 3", bundle: resourceBundle)

    /// The "Background 4" asset catalog image resource.
    static let background4 = ImageResource(name: "Background 4", bundle: resourceBundle)

    /// The "Background 5" asset catalog image resource.
    static let background5 = ImageResource(name: "Background 5", bundle: resourceBundle)

    /// The "Background 6" asset catalog image resource.
    static let background6 = ImageResource(name: "Background 6", bundle: resourceBundle)

    /// The "Background 7" asset catalog image resource.
    static let background7 = ImageResource(name: "Background 7", bundle: resourceBundle)

    /// The "Background 8" asset catalog image resource.
    static let background8 = ImageResource(name: "Background 8", bundle: resourceBundle)

    /// The "Background 9" asset catalog image resource.
    static let background9 = ImageResource(name: "Background 9", bundle: resourceBundle)

    /// The "Blob" asset catalog image resource.
    static let blob = ImageResource(name: "Blob", bundle: resourceBundle)

    /// The "logo_big" asset catalog image resource.
    static let logoBig = ImageResource(name: "logo_big", bundle: resourceBundle)

    /// The "logo_small" asset catalog image resource.
    static let logoSmall = ImageResource(name: "logo_small", bundle: resourceBundle)

}

// MARK: - Backwards Deployment Support -

/// A color resource.
struct ColorResource: Hashable {

    /// An asset catalog color resource name.
    fileprivate let name: String

    /// An asset catalog color resource bundle.
    fileprivate let bundle: Bundle

    /// Initialize a `ColorResource` with `name` and `bundle`.
    init(name: String, bundle: Bundle) {
        self.name = name
        self.bundle = bundle
    }

}

/// An image resource.
struct ImageResource: Hashable {

    /// An asset catalog image resource name.
    fileprivate let name: String

    /// An asset catalog image resource bundle.
    fileprivate let bundle: Bundle

    /// Initialize an `ImageResource` with `name` and `bundle`.
    init(name: String, bundle: Bundle) {
        self.name = name
        self.bundle = bundle
    }

}

#if canImport(AppKit)
@available(macOS 10.13, *)
@available(macCatalyst, unavailable)
extension AppKit.NSColor {

    /// Initialize a `NSColor` with a color resource.
    convenience init(resource: ColorResource) {
        self.init(named: NSColor.Name(resource.name), bundle: resource.bundle)!
    }

}

protocol _ACResourceInitProtocol {}
extension AppKit.NSImage: _ACResourceInitProtocol {}

@available(macOS 10.7, *)
@available(macCatalyst, unavailable)
extension _ACResourceInitProtocol {

    /// Initialize a `NSImage` with an image resource.
    init(resource: ImageResource) {
        self = resource.bundle.image(forResource: NSImage.Name(resource.name))! as! Self
    }

}
#endif

#if canImport(UIKit)
@available(iOS 11.0, tvOS 11.0, *)
@available(watchOS, unavailable)
extension UIKit.UIColor {

    /// Initialize a `UIColor` with a color resource.
    convenience init(resource: ColorResource) {
#if !os(watchOS)
        self.init(named: resource.name, in: resource.bundle, compatibleWith: nil)!
#else
        self.init()
#endif
    }

}

@available(iOS 11.0, tvOS 11.0, *)
@available(watchOS, unavailable)
extension UIKit.UIImage {

    /// Initialize a `UIImage` with an image resource.
    convenience init(resource: ImageResource) {
#if !os(watchOS)
        self.init(named: resource.name, in: resource.bundle, compatibleWith: nil)!
#else
        self.init()
#endif
    }

}
#endif

#if canImport(SwiftUI)
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension SwiftUI.Color {

    /// Initialize a `Color` with a color resource.
    init(_ resource: ColorResource) {
        self.init(resource.name, bundle: resource.bundle)
    }

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension SwiftUI.Image {

    /// Initialize an `Image` with an image resource.
    init(_ resource: ImageResource) {
        self.init(resource.name, bundle: resource.bundle)
    }

}
#endif