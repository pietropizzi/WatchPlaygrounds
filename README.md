![⌚Watch Playgrounds](https://user-images.githubusercontent.com/410305/81161304-a8984900-8f8b-11ea-9650-c146be1492e9.png)

---

![twitter: @pietropizzi](https://img.shields.io/badge/twitter-%40pietropizzi-blue)

Easily frame your  Watch UI in Swift Playgrounds.

Let's have a look at an example:

![Screenshot macOS](https://user-images.githubusercontent.com/410305/81155315-19883280-8f85-11ea-801a-6d49b94a61e7.png)

### 🏗 Setup

#### Mac

1. Install [Swift Playgrounds for Mac](https://apps.apple.com/app/id1496833156) if you haven't already.
1. Download the [latest playground as zip file](https://github.com/pietropizzi/WatchPlaygrounds/blob/master/playground/Watch%20Playgrounds.playgroundbook.zip?raw=true) and unpack it.
1. Double click the unpacked `Watch Playgrounds.playgroundbook` file and confirm that you want to import it to Swift Playgrounds
1. You're done.

#### iPad

1. Install [Swift Playgrounds for iPad](https://apps.apple.com/app/id908519492) if you haven't already.
1. Download the [latest playground as zip file](https://github.com/pietropizzi/WatchPlaygrounds/blob/master/playground/Watch%20Playgrounds.playgroundbook.zip?raw=true).
1. Find the zip file in the `Downloads` folder inside the `Files` app and unpack it.
1. Drag (or longpress and move / copy) the `Watch Playgrounds.playgroundbook` file inside the `Playgrounds` folder inside `iCloud Drive`.
1. You're done.

### 👩‍💻 Usage

Once you downloaded and opened the `.playgroundbook` in Swift Playgrounds (see **Usage**) simply use the `WatchPreviews` component passing your UI as last argument. Here it is called with all available options (The example values are the default values).


```swift
let previews = WatchPreviews(
    models: [.mm38, .mm42, .mm40, .mm44], // Provide the watch models you want to see the previews for.
    tintColor: Color.gray, // The color in which the title in the status bar will be rendered
    title: "Your Title", // The title for the status bar
    time: "9:41" // The time to show in the status bar
) {
    // Insert your UI here
}
```

### 💖 Motivation

I wanted to be able to prototype ideas for an  Watch app on both, my Mac and my iPad. Switching seamlessly between them. Since [Swift Playgrounds](https://www.apple.com/swift/playgrounds/) is now supported on both platforms it was the perfect candidate. To get a better feel for how the UI looks in  Watch frames of all available sizes I created these frames.

### 🚧 Limitations

These aren't real previews and most importantly this is not SwiftUI on watchOS it is SwiftUI on iOS. That means (among other things):

* Many of the built-in components won't render as they would on watchOS. For example `List` or `Picker` because they are quite different between watchOS and iOS.
* The semantic font sizes like `title`, `body`, `caption`, etc. will most probably not be what you want since, again, they are iOS specific in Swift Playgrounds.
* Same for the semantic colors like `primaryColor`, `secondaryColor`, etc. watchOS's colors might be the same as iOS's colors in darkmode though. So if you run your iPadOS or macOS in dark mode it might be the same colors.
