# ⌚Watch Playground

![twitter: @pietropizzi](https://img.shields.io/badge/twitter-%40pietropizzi-blue)

Easily frame your  Watch UI in Swift Playgrounds.

Here's how it looks:

![Screenshot iPad](https://user-images.githubusercontent.com/410305/81097581-6a0d7a80-8f08-11ea-8296-9044216ed9ba.png)

### Motivation

I wanted to be able to prototype ideas for an  Watch app on both, my Mac and my iPad. Switching seamlessly between them. Since [Swift Playgrounds](https://www.apple.com/swift/playgrounds/) is now supported on both platforms it was the perfect candidate. To get a better feel for how the UI looks in  Watch frames of all available sizes I created these frames.

### How to set this up

TODO

### How to use this

Once you downloaded and opened the `.playgroundbook` in Swift Playgrounds simply use the `WatchPreviews` component passing your UI as last argument. Here it is called with all available options (The example values are the default values).


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

### Limitations

These aren't real previews and most importantly this is not SwiftUI on watchOS it is SwiftUI on iOS. That means (among other things):

* Many of the built-in components won't render as they would on watchOS. For example `List` or `Picker` because they are quite different between watchOS and iOS.
* The semantic font sizes like `title`, `body`, `caption`, etc. will most probably not be what you want since, again, they are iOS specific in Swift Playgrounds.
* Same for the semantic colors like `primaryColor`, `secondaryColor`, etc. watchOS's colors might be the same as iOS's colors in darkmode though. So if you run your iPadOS or macOS in dark mode it might be the same colors.
