//
//  BlogPostCell.swift
//  ios101-project5-tumblr
//
//  Created by Melissa Gaines on 10/16/23.
//

import UIKit

class BlogPostCell: UITableViewCell {

    @IBOutlet weak var postPhotoImageView: UIImageView!
    @IBOutlet weak var summaryLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}