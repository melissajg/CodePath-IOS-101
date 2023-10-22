//
//  DetailViewController.swift
//  ios101-project6-tumblr
//
//  Created by Melissa Gaines on 10/20/23.
//

import UIKit
import Nuke

class DetailViewController: UIViewController {
    // Property to store the passed in movie
    var blogPost: Post!
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var captionTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // MARK: - Configure the labels
        print(blogPost.caption)
        
        let caption: String = blogPost.caption
        
        let fixCaption = caption.replacingOccurrences(of: "<p>", with: "")
        let fixedCaption = fixCaption.replacingOccurrences(of: "<br/>", with: "")
        let captionFixed = fixedCaption.replacingOccurrences(of: "</p>", with: "")
        captionTextView.text = captionFixed
        captionTextView.sizeToFit()
        /*
        let beginOfSentence = caption.firstIndex(of: "\"")!
        let endOfSentence = caption.range(of: "world!")?.lowerBound {
        let captionSubString = caption[beginOfSentence...endOfSentence]
        captionTextView.text = String(captionSubString)
        captionTextView.sizeToFit()
*/
        /*
         tried to make optional binding but not sure where
         im going wrong
         
        if let summary = blogPost.summary {
            summaryLabel.text = summary
        } else {
            summaryLabel.text = "No summary"
        }
         */
       
        
        // MARK: - Configure the image views
        if let photo = blogPost.photos.first {
            let url = photo.originalSize.url
            Nuke.loadImage(with: url, into: posterImageView)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
