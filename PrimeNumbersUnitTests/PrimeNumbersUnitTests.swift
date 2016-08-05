//
//  PrimeNumbersUnitTests.swift
//  PrimeNumbersUnitTests
//
//  Created by Efrain Ayllon on 8/5/16.
//  Copyright © 2016 Efrain Ayllon. All rights reserved.
//

import XCTest
@testable import PrimeNumbers

class PrimeNumbersUnitTests: XCTestCase {
    
    private var storyboard: UIStoryboard!
    private var controller: PrimeViewController!
    
    override func setUp() {
        super.setUp()
        storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        controller = storyboard.instantiateViewControllerWithIdentifier("PrimeViewController") as! PrimeViewController
        let _ = controller.view
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testNoNonNumbers() {
        controller.textField.text = "5..12"
        controller.someButtonPressed()
        let outputs = controller.someLabel.text!
        XCTAssertTrue(outputs == "UH OH Invalid Input")
        controller.textField.text = "1?2!"
        controller.someButtonPressed()
        let outputsDos = controller.someLabel.text!
        XCTAssertTrue(outputsDos == "UH OH Invalid Input")
    }
    
    
    func testNoDecimalNumbers() {
        controller.textField.text = "3.1"
        controller.someButtonPressed()
        let outputs = controller.someLabel.text!
        XCTAssertTrue(outputs == "UH OH Invalid Input")
        controller.textField.text = "33.7"
        controller.someButtonPressed()
        let outputsDos = controller.someLabel.text!
        XCTAssertTrue(outputsDos == "UH OH Invalid Input")
    }
    
    func testNoEmptyInput() {
        controller.textField.text = ""
        controller.someButtonPressed()
        let outputs = controller.someLabel.text!
        XCTAssertTrue(outputs == "UH OH Invalid Input")
    }
    
    func testNoLettersOrSpecialCharacters() {
        controller.textField.text = "abc12&^*1#"
        controller.someButtonPressed()
        let outputs = controller.someLabel.text!
        XCTAssertTrue(outputs == "UH OH Invalid Input")
    }
    
    func testOnly0to100() {
        controller.textField.text = "101"
        controller.someButtonPressed()
        let outputs = controller.someLabel.text!
        XCTAssertTrue(outputs == "UH OH Invalid Input")
        controller.textField.text = "-5"
        controller.someButtonPressed()
        let outputsDos = controller.someLabel.text!
        XCTAssertTrue(outputsDos == "UH OH Invalid Input")
    }
}