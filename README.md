<p align="center">
  <img src="https://github.com/StefKors/ViewToAppIconSet/blob/main/Images/mac256.png" height="128">
  <h1 align="center">ViewToAppIconSet</h1>
</p>

![ViewToAppIconSet](https://github.com/StefKors/ViewToAppIconSet) a Swift Library to generate an Xcode `AppIcon.appiconset` from a SwiftUI view.

#### Supported Platforms
<p align="left">
<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://github.com/StefKors/ViewToAppIconSet/blob/main/Images/macos.svg">
  <source media="(prefers-color-scheme: light)" srcset="https://github.com/StefKors/ViewToAppIconSet/blob/main/Images/macos-active.svg">
  <img alt="macos" src="https://github.com/StefKors/ViewToAppIconSet/blob/main/Images/macos-active.svg" height="24">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://github.com/StefKors/ViewToAppIconSet/blob/main/Images/ios-active.svg">
  <source media="(prefers-color-scheme: light)" srcset="https://github.com/StefKors/ViewToAppIconSet/blob/main/Images/ios.svg">
  <img alt="macos" src="https://github.com/StefKors/ViewToAppIconSet/blob/main/Images/ios-active.svg" height="24">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://github.com/StefKors/ViewToAppIconSet/blob/main/Images/ipados-active.svg">
  <source media="(prefers-color-scheme: light)" srcset="https://github.com/StefKors/ViewToAppIconSet/blob/main/Images/ipados.svg">
  <img alt="macos" src="https://github.com/StefKors/ViewToAppIconSet/blob/main/Images/ipados-active.svg" height="24">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://github.com/StefKors/ViewToAppIconSet/blob/main/Images/tvos-active.svg">
  <source media="(prefers-color-scheme: light)" srcset="https://github.com/StefKors/ViewToAppIconSet/blob/main/Images/tvos.svg">
  <img alt="macos" src="https://github.com/StefKors/ViewToAppIconSet/blob/main/Images/tvos-active.svg" height="24">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://github.com/StefKors/ViewToAppIconSet/blob/main/Images/watchos-active.svg">
  <source media="(prefers-color-scheme: light)" srcset="https://github.com/StefKors/ViewToAppIconSet/blob/main/Images/watchos.svg">
  <img alt="macos" src="https://github.com/StefKors/ViewToAppIconSet/blob/main/Images/watchos-active.svg" height="24">
</picture>
</p>

# Getting Started

This is how you get started using ViewToAppIconSet in your project.

## Installation

ViewToAppIconSet is distributed using the [Swift Package Manager](https://www.swift.org/package-manager/). Install it in a project by adding it as a dependency in your Package.swift manifest or through "Package Dependencies" in  project settings.

```
git@github.com:StefKors/ViewToAppIconSet.git
```

```swift
let package = Package(
    dependencies: [
        .package(url: "git@github.com:StefKors/ViewToAppIconSet.git", from: "0.1.0")
    ]
)
```

If you find this package useful, please star the repo ⭐️

## Usage
Create a view with your App Icon and use SwiftUI Previews to design.

```swift
import ViewToAppIconSet
import SwiftUI

struct AppIcon: View {
    @IconRelativeMetric var padding = 10 /// 10% padding
    let color: Color
    var body: some View {
        ContainerRelativeShape()
            .fill(Color.accentColor)
            .overlay(content: {
                Image(systemName: "circle.hexagongrid.fill")
                    .resizable()
                    .scaledToFit()
                    .padding(padding)
            })
    }
}

struct AppIcon_Previews: PreviewProvider {
    static var previews: some View {
        AppIcon()
            .iconStyle(.macOS)
            .frame(width: 100, height: 100, alignment: .center)
            .scenePadding()
    }
}

```

Call `generateAppIconSet` to generate the AppIconSet images
```swift
import ViewToAppIconSet

let path = try generateAppIconSet(from: AppIcon())
```
The output has the following structure:
```graphql
AppIcon.appiconset
    ├── Contents.json
    ├── appstore1024.png
    ├── ipad152.png
    ├── ipad76.png
    ├── ipadNotification20.png
    ├── ipadNotification40.png
    ├── ipadPro167.png
    ├── ipadSettings29.png
    ├── ipadSettings58.png
    ├── ipadSpotlight40.png
    ├── ipadSpotlight80.png
    ├── iphone120.png
    ├── iphone180.png
    ├── mac1024.png
    ├── mac128.png
    ├── mac16.png
    ├── mac256.png
    ├── mac32.png
    ├── mac512.png
    ├── mac64.png
    ├── notification40.png
    ├── notification60.png
    ├── settings58.png
    ├── settings87.png
    ├── spotlight120.png
    └── spotlight80.png
```
Built by ![Stef Kors](https://stefkors.com)
