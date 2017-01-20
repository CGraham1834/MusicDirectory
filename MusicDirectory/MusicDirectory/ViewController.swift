//
//  ViewController.swift
//  MusicDirectory
//
//  Created by Cory Graham on 1/19/17.
//  Copyright © 2017 Graham.co. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    var MusicList : NSMutableArray!
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var cache = NSCache<AnyObject, AnyObject>()
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getMusic(mySelector : Selector, searchTerm : String)
    {
        let myAPICall = APIVersionOne()
        myAPICall.getMusicInformation(searchTerm: searchTerm, caller:self, selector: mySelector)
        
    }
    
    func handleResponse(response : APIResponse)
    {
        MusicList = NSMutableArray()
        let myArray = response.jsonResouceArray()
        
        for object in myArray
        {
            let myDevice = MusicObject(artist: (object as! NSDictionary).object(forKey: "artistName") as! String?, album: (object as! NSDictionary).object(forKey: "collectionName") as! String?, track: (object as! NSDictionary).object(forKey: "trackName") as! String?, art: (object as! NSDictionary).object(forKey: "artworkUrl30") as! String?)
            MusicList.add(myDevice)
        }
        
        DispatchQueue.main.async{
            self.tableView.reloadData()
        }
       
   
    }

 

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if((MusicList) != nil)
        {
        return MusicList.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! MainTableViewCell
        let item = MusicList.object(at: indexPath.row) as! MusicObject
        cell.artistName.text = item.artistName
        cell.trackName.text = item.trackName
        cell.albumName.text = item.albumName
        var namingConvention : String!
        if((item.albumName) != nil)
        {
            namingConvention = item.albumName
        }
        
       else
        {
            namingConvention = item.artistName + item.trackName
        }
        if let img = cache.object(forKey: namingConvention as AnyObject) {
            cell.mainImage.image =  (img as! UIImage)
        }
        else
        {
            DispatchQueue.global().async {
                let data = NSData(contentsOf: URL(string: (item.artImageURL)!)!)
                DispatchQueue.main.async {
                    cell.mainImage.image = UIImage(data: data as! Data)
                    self.cache.setObject(UIImage(data: data as! Data)!, forKey: namingConvention as AnyObject)
                }
            }
        }
        return cell
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
                 getMusic(mySelector: #selector(handleResponse(response:)), searchTerm: textField.text!)
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let destination = segue.destination as? DetailViewController
        let selectedIndex = tableView.indexPathForSelectedRow?.row
        let item = MusicList.object(at: selectedIndex!) as! MusicObject
        if let img = cache.object(forKey: item.albumName as AnyObject)
        {
            destination?.image = (img as! UIImage)
        }
        
        destination?.title = item.artistName
        destination?.artist = item.artistName
        destination?.track = item.trackName
        destination?.album = item.albumName
        
        
    }
}

