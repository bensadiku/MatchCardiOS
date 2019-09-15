//
//  ViewController.swift
//  MatchCardiOS
//
//  Created by ben on 15/09/2019.
//  Copyright © 2019 ben. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var model = CardModel()
    var cardArray  = [Card]()
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        //Gets the generated card array
        cardArray = model.getCards()
        
        //assign the view controller
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    // implementing required UICollectionView protocol methods

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cardArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath)
        
        return cell
    }

    //called when user taps the cell on the grid
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

