//
//  ViewController.swift
//  MatchCardiOS
//
//  Created by ben on 15/09/2019.
//  Copyright © 2019 ben. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var model = CardModel()
    var cardArray  = [Card]()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Gets the generated card array
        cardArray = model.getCards()
        
    }


}

