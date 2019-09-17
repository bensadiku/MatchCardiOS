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
    
    //keep track of cards flipped over
    var firstFlippedCardIndex:IndexPath?
    
    
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
    
    //Cast because dequeue doesn't know about CardCollectionViewCell calss
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCollectionViewCell
        
        //get card from array and passit to the CCVC to display the image
        let card = cardArray[indexPath.row]
        cell.setCard(card)
        
        return cell
    }

    //called when user taps the cell on the grid
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //get the ccvc from the collection using the index path and cast it so that we can use the methods the class has (flip)
        let cell =  collectionView.cellForItem(at: indexPath) as! CardCollectionViewCell
        
        //gets the card user selected
        let card = cardArray[indexPath.row]
        
        //if this card has not been flipped, flip it
        if card.isFlipped == false  && card.isMatched == false{
            
            cell.flip()
            
            //the card status is flipped
            card.isFlipped = true
            
            //check if it's the first card or the second that is flipped
            // if it's nil, it's the first card that's being flipped
            if firstFlippedCardIndex == nil {
                
                firstFlippedCardIndex = indexPath
                
            } else {
                //it's the second card that's being flipped
                //check if it's a match and remove them, else flip them back
                checkIfCardMatch(indexPath)
            }
        }
    }
    
    //gets the cells for the two cards that are shown and the cards for those
    //compares the image names and checks if they match
    func checkIfCardMatch(_ secondFlippedCardIndex:IndexPath){
        let cardOneCell = collectionView.cellForItem(at: firstFlippedCardIndex!) as? CardCollectionViewCell
        
        let cardTwoCell = collectionView.cellForItem(at: secondFlippedCardIndex) as? CardCollectionViewCell
        
        let cardOne = cardArray[firstFlippedCardIndex!.row]
        let cardTwo = cardArray[secondFlippedCardIndex.row]
        
        //Image names equal, set status and remove from the collection view
        if cardOne.imageName == cardTwo.imageName {
            //set match status to match
            cardOne.isMatched = true
            cardTwo.isMatched = true
            
            //remove the cards taht matched
            cardOneCell?.remove()
            cardTwoCell?.remove()
        }
        //else cards didn't match, revert them back to hidden
        else {
            //set the status
            cardOne.isFlipped = false
            cardTwo.isFlipped = false
            
            //flip back the cards
            cardOneCell?.flipBack()
            cardTwoCell?.flipBack()
        }
        //Force collectionview to reload cell of the first flipped card index if it's nil,
        // fixes an issue where the cell is reused, therefore nil and can't call remove() on it because of the optional chaining >> ?
        if cardOneCell == nil {
            collectionView.reloadItems(at: [firstFlippedCardIndex!])
        }
        
        
        //reset the index to nil
        firstFlippedCardIndex = nil
    }
}
