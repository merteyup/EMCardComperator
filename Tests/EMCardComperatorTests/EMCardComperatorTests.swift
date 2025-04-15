import XCTest
@testable import EMCardComperator

@MainActor
final class EMCardComperatorTests: XCTestCase {
    
    func test_OpenAccountButtonTapped_ShouldCallDelegateWithCorrectURL() {
        let mockDelegate = MockCardComperatorDelegate()
        let sut = makeSUT(delegate: mockDelegate)
        let testURL = URL(string: "https://apple.com.tr")!

        sut.openAccountButtonTapped(with: testURL)

        XCTAssertEqual(mockDelegate.receivedURL, testURL)
    }
    
    func test_DominantColorEnabled_ReturnsTrue() {
        let sut = makeSUT(isDominantColorActive: true)
        XCTAssertTrue(sut.isDominantColorActive)
    }

    func test_DominantColorDisabled_ReturnsFalse() {
        let sut = makeSUT(isDominantColorActive: false)
        XCTAssertFalse(sut.isDominantColorActive)
    }

    func test_CompactLayoutEnabled_ReturnsTrue() {
        let sut = makeSUT(isCompactLayoutEnabled: true)
        XCTAssertTrue(sut.isCompactLayoutEnabled)
    }

    func test_CompactLayoutDisabled_ReturnsFalse() {
        let sut = makeSUT(isCompactLayoutEnabled: false)
        XCTAssertFalse(sut.isCompactLayoutEnabled)
    }
    
    func test_SelectingCard_ShouldUpdateSelectedCardID() {
        let expectedID = UUID()
        let viewModel = makeSUT(selectedCardId: MockData.creditCards.first!.id)
        
        viewModel.selectedCardID = expectedID
        
        XCTAssertEqual(viewModel.selectedCardID, expectedID)
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

@MainActor
private extension EMCardComperatorTests {
    func makeSUT(
        delegate: EMCardComperatorDelegate? = MockCardComperatorDelegate(),
        selectedCardId: UUID = MockData.creditCards.first!.id,
        isCompactLayoutEnabled: Bool = false,
        isDominantColorActive: Bool = false
    ) -> EMCardComperatorViewModel {
        return EMCardComperatorViewModel(
            delegate: delegate,
            selectedCardID: selectedCardId,
            isCompactLayoutEnabled: isCompactLayoutEnabled,
            isDominantColorActive: isDominantColorActive
        )
    }
}
