//
//  ViewController.swift
//  PartyRock
//
//  Created by Ruby Vega on 07/04/2017.
//  Copyright © 2017 Ruby Vega. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    
    var partyRocks = [PartyRock]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let p1 = PartyRock(imageURL: "https://yt3.ggpht.com/-isuhTXPcuUA/AAAAAAAAAAI/AAAAAAAAAAA/ZLK_0KyKOIc/s88-c-k-no-mo-rj-c0xffffff/photo.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/SjmTFIHX1yo\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Lights Out")
        
        let p2 = PartyRock(imageURL: "https://yt3.ggpht.com/-isuhTXPcuUA/AAAAAAAAAAI/AAAAAAAAAAA/ZLK_0KyKOIc/s88-c-k-no-mo-rj-c0xffffff/photo.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/SjmTFIHX1yo\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Hello")
        
        let p3 = PartyRock(imageURL: "https://yt3.ggpht.com/-isuhTXPcuUA/AAAAAAAAAAI/AAAAAAAAAAA/ZLK_0KyKOIc/s88-c-k-no-mo-rj-c0xffffff/photo.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/SjmTFIHX1yo\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "GoodBye")
        
        let p4 = PartyRock(imageURL: "https://yt3.ggpht.com/-isuhTXPcuUA/AAAAAAAAAAI/AAAAAAAAAAA/ZLK_0KyKOIc/s88-c-k-no-mo-rj-c0xffffff/photo.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/SjmTFIHX1yo\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Party Rock")
        
        partyRocks.append(p1)
        partyRocks.append(p2)
        partyRocks.append(p3)
        partyRocks.append(p4)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView:UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath) as? PartyCell{
            
            let partyRock = partyRocks[indexPath.row]
            
            cell.updateUI(PartyRock: partyRock)
            
            return cell
            
        }else{
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return partyRocks.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let partyRock = partyRocks[indexPath.row]
        
        performSegue(withIdentifier: "VideoVC", sender: partyRock)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? VideoVC{
            
            if let party = sender as? PartyRock{
                destination.partyRock = party
            }
        }
    }
}

