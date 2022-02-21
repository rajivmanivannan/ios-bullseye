//
//  BullseyeTests.swift
//  BullseyeTests
//
//  Created by rajivmanivannan on 16/02/22.
//

import XCTest
@testable import Bullseye

class BullseyeTests: XCTestCase {

    var game : Game!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        game = Game()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        game = nil
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    
    func testScorePositive(){
        let guess = game.target + 5
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 95)
    }
    
    func testScoreNegative(){
        let guess = game.target - 5
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 95)
    }
    
    func testNewRound(){
        game.startNewRound(points:100)
        XCTAssertEqual(game.score, 100)
        XCTAssertEqual(game.round, 2)
    }
    
    func testScoreExact(){
        let guess = game.target
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 100 + 100) // Bonus 100 points
    }
    
    func testScoreClose(){
        let guess = game.target + 2
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 98 + 50) // Bonus 50 points
    }
    
    func testRestart(){
        game.startNewRound(points:100)
        XCTAssertNotEqual(game.score, 0)
        XCTAssertNotEqual(game.round, 1)
        game.restart()
        XCTAssertEqual(game.score, 0)
        XCTAssertEqual(game.round, 1)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
