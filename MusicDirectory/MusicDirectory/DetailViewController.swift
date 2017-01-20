//
//  DetailViewController.swift
//  MusicDirectory
//
//  Created by Cory Graham on 1/20/17.
//  Copyright © 2017 Graham.co. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var artist : String!
    var track : String!
    var album : String!
    var image : UIImage!
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var artistName: UILabel!
    
    @IBOutlet weak var TrackName: UILabel!
    @IBOutlet weak var AlbumName: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        artistName.text = artist
        TrackName.text = track
        AlbumName.text = album
        imageView.image = image
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
//    func getLyrics(mySelector : Selector)
//    {
//        let MyApI = APIVersionOne()
//        let myDevice =   MusicList.object(at: 0) as! MusicObject
//        MyApI.getLyrics(artistName: myDevice.artistName.replace(target: " ", withString: "+"), songName: myDevice.trackName.replace(target: " ", withString: "+"), caller: self, selector: mySelector)
//    }
//    
//    func handleGetLyrics(response : APIResponse)
//    {
//        print(response)
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
