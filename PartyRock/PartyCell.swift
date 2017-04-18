//
//  PartyCell.swift
//  PartyRock
//
//  Created by Ruby Vega on 08/04/2017.
//  Copyright © 2017 Ruby Vega. All rights reserved.
//

import UIKit

class PartyCell: UITableViewCell {

    @IBOutlet weak var videoPreviewImage: UIImageView!
    @IBOutlet weak var videoTitle: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func updateUI(PartyRock : PartyRock){
        
        videoTitle.text = PartyRock.videoTitle

        let url = URL(string: PartyRock.imageURL)!
        
        DispatchQueue.global().async {
            do{
                let data = try Data(contentsOf: url)
                DispatchQueue.global().sync {
                    self.videoPreviewImage.image = UIImage(data: data)
                }
            }catch{
            
            }
        }
        
        
    }

}
