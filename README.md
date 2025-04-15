# EMCardComperator

`EMCardComperator` is a SwiftUI-based component designed for comparing credit cards. It allows users to select and display credit card information, choose layouts, and even extract dominant colors from the bank logo images.

## Features

- Card Selection: A user-friendly interface to select a credit card from a list of options.

- Layout Support: Offers both compact and expanded layouts to display card details.

- Dominant Color Extraction: Extracts and applies the dominant color of a credit card's logo for dynamic background styling.

- Animation Support: Provides smooth animations when changing cards.

- Customizable: Easily customizable for your own use cases, with support for different color schemes and layout styles.


## Installation

To use `EMCardComperator` in your project, you can integrate it with Swift Package Manager (SPM).

1. In Xcode, go to File > Swift Packages > Add Package Dependency.

2. Enter the repository URL:

```bash
https://github.com/yourusername/EMCardComperator.git
```

## Usage

Here’s a simple example to get you started:

```swift
import SwiftUI
import EMCardComperator

final class ContainerViewModel: ObservableObject, EMCardComperatorDelegate {
    func userDidTapOpenAccount(url: URL) {
        print("🔗 Container App received link 🔗: \(url)")

    }
}

struct ContentView: View {
    @StateObject private var delegateVM = ContainerViewModel()
    @StateObject private var sdkViewModel: EMCardComperatorViewModel

    init() {
        let delegate = ContainerViewModel()
        _delegateVM = StateObject(wrappedValue: delegate)
        _sdkViewModel = StateObject(wrappedValue: EMCardComperatorViewModel(delegate: delegate,
                                                                            isCompactLayoutEnabled: true,
                                                                            isDominantColorActive: true))
    }

    var body: some View {
        SelectItemView(viewModel: sdkViewModel)
            .padding()
    }
}

#Preview {
    let previewViewModel = EMCardComperatorViewModel(delegate: PreviewDelegate())
    SelectItemView(viewModel: previewViewModel, isDominantColorActive: false)
}
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first
to discuss what you would like to change.

## License

[MIT](https://choosealicense.com/licenses/mit/)
