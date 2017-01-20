//
//  MusicObjectTests.swift
//  MusicDirectory
//
//  Created by Cory Graham on 1/19/17.
//  Copyright © 2017 Graham.co. All rights reserved.
//

import XCTest

class MusicObjectTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testMusicObjectNotNil()
    {
        let myObject = MusicObject()
        XCTAssertNotNil(myObject)
    }
    
    func testMusicObjectArtistName()
    {
        let myObject = MusicObject(artist: "The Weeknd")
        XCTAssertNotNil(myObject.artistName)
        XCTAssertEqual(myObject.artistName, "The Weeknd")
    }
    
    func testMusicObjectAlbumName()
    {
        let myObject = MusicObject(artist: "The Weeknd", album: "I Can't feel my face")
        
        XCTAssertEqual(myObject.albumName, "I Can't feel my face")
    }
    
    func testMusicObjectTrackName()
    {
        let myObject = MusicObject(artist: "The Weeknd", album: "I Can't feel my Face", track: "The Hills")
        XCTAssertEqual(myObject.trackName, "The Hills")
    }
    
    func testMusicObjectImageURL()
    {
        let myObject = MusicObject(artist: "The Weeknd", album: "I Can't feel my Face", track: "The Hills", art : "Https.Google.com")
        
        XCTAssertEqual(myObject.artImageURL, "Https.Google.com")
    }
    
    func testMusicObjectLyrics()
    {
        let myObject = MusicObject(artist: "The Weeknd", album: "I Can't feel my Face", track: "The Hills", art: "Https.Google.com", lyrics: "Some lyrics are here to fill this space")
        
        XCTAssertEqual(myObject.lyricsString, "Some lyrics are here to fill this space")
    }
    
}
