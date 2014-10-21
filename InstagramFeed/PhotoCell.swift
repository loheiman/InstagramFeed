//
//  PhotoCell.swift
//  InstagramFeed
//
//  Created by Loren Heiman on 10/20/14.
//  Copyright (c) 2014 Loren Heiman. All rights reserved.
//

import UIKit

class PhotoCell: UITableViewCell {

    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var photoImageView: UIImageView!
    //@IBOutlet weak var urlLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
                
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
