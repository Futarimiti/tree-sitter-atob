import XCTest
import SwiftTreeSitter
import TreeSitterAtob

final class TreeSitterAtobTests: XCTestCase {
    func testCanLoadGrammar() throws {
        let parser = Parser()
        let language = Language(language: tree_sitter_atob())
        XCTAssertNoThrow(try parser.setLanguage(language),
                         "Error loading A=B grammar")
    }
}
