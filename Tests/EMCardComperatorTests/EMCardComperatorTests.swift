import XCTest
@testable import EMCardComperator

final class EMCardComperatorTests: XCTestCase {
    
    
    func test_openAccountButtonTapped_shouldCallDelegateWithCorrectURL() throws {
        
        // Given
        let sut = MockCardComperatorDelegate()
        let viewModel = EMCardComperatorViewModel(delegate: sut)
        let testURL = URL(string: "https://apple.com.tr")!
        
        // When
        viewModel.openAccountButtonTapped(with: testURL)
        
        // Then
        XCTAssertEqual(sut.receivedURL, testURL)
    
    }
    
    func test_DominantColorEnabled_ReturnsTrue() throws {
        // Given
        let sut = EMCardComperatorViewModel(delegate: MockCardComperatorDelegate())
        
        // When
        let result = sut.isDominantColorActive
        
        // Then
        XCTAssertEqual(result, true)
    }
}


extension EMCardComperatorTests {
    final class MockCardComperatorDelegate: EMCardComperatorDelegate {
        var receivedURL: URL?
        
        func userDidTapOpenAccount(url: URL) {
            receivedURL = url
        }
    }
}

private extension EMCardComperatorTests {
    func makeSUT(
        delegate: EMCardComperatorDelegate? = MockCardComperatorDelegate(),
        isCompactLayoutEnabled: Bool = false,
        isDominantColorActive: Bool = false
    ) -> EMCardComperatorViewModel {
        return EMCardComperatorViewModel(
            delegate: delegate,
            isCompactLayoutEnabled: isCompactLayoutEnabled,
            isDominantColorActive: isDominantColorActive
        )
    }
}
