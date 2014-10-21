//
//  PhotosViewController.swift
//  InstagramFeed
//
//  Created by Loren Heiman on 10/20/14.
//  Copyright (c) 2014 Loren Heiman. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var photos: NSArray! = []
    var photoSection = 0 as Int
    

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        var clientId = "1f816afeb5924789bcfb47b2e5025f84"
      
        var url = NSURL(string: "https://api.instagram.com/v1/media/popular?client_id=\(clientId)")
        //var url = NSURL(string: "https://api.instagram.com/v1/users/30625899/media/recent/?client_id=\(clientId)")
        
        
        var request = NSURLRequest(URL: url!)
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
            var responseDictionary = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as NSDictionary
            self.photos = responseDictionary["data"] as NSArray
            self.tableView.reloadData()
            

        }
        
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        
        tableView.rowHeight = 320
        
       
        
        
        // Do any additional setup after loading the view.
    }

    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        var cell = tableView.dequeueReusableCellWithIdentifier("PhotoCell") as PhotoCell
        
        var photo: AnyObject = photos[indexPath.section]
        var images = photo["images"] as NSDictionary
        var resolution = images["standard_resolution"] as NSDictionary
        var imageUrl = resolution["url"] as String
        cell.photoImageView.setImageWithURL(NSURL(string: imageUrl))
        
        var user = photo["user"] as NSDictionary

        return cell
        
    
    }
    
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var headerView = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
        headerView.backgroundColor = UIColor(white: 1.0, alpha: 0.9)
        
        var profilePhotoImageView = UIImageView(frame: CGRect (x: 8, y: 8, width: 40, height: 40))
        
        var photo: AnyObject = photos[section]
        
        
        /*
        var cell = tableView.dequeueReusableCellWithIdentifier("PhotoCell") as PhotoCell
        var images = photo["images"] as NSDictionary
        var resolution = images["standard_resolution"] as NSDictionary
        var imageUrl = resolution["url"] as String
        cell.photoImageView.setImageWithURL(NSURL(string: imageUrl))
*/
        
        var user = photo["user"] as NSDictionary
        var userName = user["username"] as String
        var userImageUrl = user["profile_picture"] as String
        profilePhotoImageView.setImageWithURL(NSURL(string: userImageUrl))
        profilePhotoImageView.layer.cornerRadius = profilePhotoImageView.frame.height/2
        profilePhotoImageView.clipsToBounds = true

        
        var label = UILabel(frame: CGRect(x: 55, y: 10, width: 200, height: 30) )
        label.text = userName
        label.font = UIFont.systemFontOfSize(17)
        headerView.addSubview(label)
        headerView.addSubview(profilePhotoImageView)
        return headerView
    }
    
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return photos.count
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }

    
 
    
    
    
}
