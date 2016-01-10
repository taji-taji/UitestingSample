//
//  UitestingSampleUITests.swift
//  UitestingSampleUITests
//
//  Created by tajika on 2016/01/10.
//  Copyright © 2016年 Tajika. All rights reserved.
//

import XCTest

class UitestingSampleUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        
        let app = XCUIApplication()
        
        // 「=」ボタンを取得
        let resultButton = app.buttons["resultButton"]
        
        // 「=」ボタンがdisabled
        XCTAssertFalse(resultButton.enabled)

        // 左辺のテキストフィールドを取得
        let leftValueTextField = app.textFields["leftValueTextField"]
        // 左辺のテキストフィールドをタップしてフォーカスを当てる
        leftValueTextField.tap()
        // 12と入力
        leftValueTextField.typeText("12")
        
        // 「=」ボタンがdisabled
        XCTAssertFalse(resultButton.enabled)
        
        // 右辺のテキストフィールドを取得
        let rightValueTextField = app.textFields["rightValueTextField"]
        // 右辺のテキストフィールドをタップしてフォーカスを当てる
        rightValueTextField.tap()
        // 4と入力
        rightValueTextField.typeText("4")
        
        // 「=」ボタンがenabled
        XCTAssertTrue(resultButton.enabled)
        
        // 「=」ボタンをタップ
        app.buttons["resultButton"].tap()
        
        let resultLabel = app.staticTexts["resultLabel"]
        
        // 結果を表示するラベルのテキストが「48.0」になっていれば成功
        XCTAssertEqual(resultLabel.label, "48.0")
    }
    
}
