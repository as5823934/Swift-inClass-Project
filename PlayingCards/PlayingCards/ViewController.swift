//
//  ViewController.swift
//  PlayingCards
//
//  Created by ping tseng tsai on 2018-05-22.
//  Copyright © 2018 ping tseng tsai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var deck = PlayingCardDeck()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for _ in 0..<10 {
            if let card = deck.draw() {
                print(card)
            }
        }
        
    }
    
    //life cycle methods
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //animation
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //networking, database
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        //if bounds change, your want t o reposition some of your subview
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        //when your device toates, (viewQill/ DidLayoutSubviews) get called and then call viewWillTransition
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //clean up code
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        //its rare, but occasionally your device will run low-memory
        //this usually means a buildup of very large video, images or sounds
        //when a low-memory occurs, ios will call this method
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // this method is called to all objects that come out of a storyboard
        // can init stuff
    }


}

