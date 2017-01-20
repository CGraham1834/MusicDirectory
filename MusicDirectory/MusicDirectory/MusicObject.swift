//
//  MusicObject.swift
//  MusicDirectory
//
//  Created by Cory Graham on 1/19/17.
//  Copyright © 2017 Graham.co. All rights reserved.
//

import UIKit

class MusicObject: NSObject {
    var artistName: String!
    var albumName : String!
    var trackName : String!
    var artImageURL : String!
    var lyricsString : String!
    
    init(artist : String? = nil, album : String? = nil, track : String? = nil, art : String? = nil, lyrics : String? = nil ) {
        artistName = artist
        albumName = album
        trackName = track
        artImageURL = art
        lyricsString = lyrics
    }
}
