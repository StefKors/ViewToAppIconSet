<p align="center">
  <img src="Images/mac256.png" height="128">
  <h1 align="center">ViewToAppIconSet</h1>
</p>

![ViewToAppIconSet](https://github.com/StefKors/ViewToAppIconSet) a Swift Library to generate an Xcode AppIconSet from a SwiftUI view. 

#### Supported Platforms
<p align="left">
<picture>
  <source media="(prefers-color-scheme: dark)" srcset="Images/macos.svg">
  <source media="(prefers-color-scheme: light)" srcset="Images/macos-active.svg">
  <img alt="macos" src="Images/macos-active.svg" height="24">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="Images/ios-active.svg">
  <source media="(prefers-color-scheme: light)" srcset="Images/ios.svg">
  <img alt="macos" src="Images/ios-active.svg" height="24">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="Images/ipados-active.svg">
  <source media="(prefers-color-scheme: light)" srcset="Images/ipados.svg">
  <img alt="macos" src="Images/ipados-active.svg" height="24">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="Images/tvos-active.svg">
  <source media="(prefers-color-scheme: light)" srcset="Images/tvos.svg">
  <img alt="macos" src="Images/tvos-active.svg" height="24">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="Images/watchos-active.svg">
  <source media="(prefers-color-scheme: light)" srcset="Images/watchos.svg">
  <img alt="macos" src="Images/watchos-active.svg" height="24">
</picture>
</p>

-------

# Getting Started

This is how you get started using ViewToAppIconSet in your project.

## Installation

ViewToAppIconSet is distributed using the [Swift Package Manager](https://www.swift.org/package-manager/). Install it in a project by adding it as a dependency in your Package.swift manifest or through "Package Dependencies" in  project settings.

```swift
let package = Package(
    dependencies: [
        .package(url: "git@github.com:StefKors/ViewToAppIconSet.git", from: "0.1.0")
    ]
)
```

## Usage
Create a view with your App Icon and use SwiftUI Previews to design.

```swift
import ViewToAppIconSet
import SwiftUI

struct AppIcon: View {
    let color: Color
    var body: some View {
        ContainerRelativeShape()
            .fill(Color.accentColor)
    }
}

struct AppIcon_Previews: PreviewProvider {
    static var previews: some View {
        AppIcon()
            .iconStyle(.macOS)
            .scenePadding()
    }
}

```

Call `generateAppIconSet` to generate the AppIconSet
```swift
import ViewToAppIconSet

let path = try generateAppIconSet(from: AppIcon())
```

It's a good idea to use the provided `AppIconRenderer` to render your AppIcons:

```swift
AppIconRenderer(large: {
    AppIcon
}, medium: {
    AppIcon
}, small: {
    AppIcon
})
.iconStyle(.iOS)
```

Built by ![Stef Kors](https://stefkors.com)
