//
//  CardCollectionViewCell.swift
//  MatchCardiOS
//
//  Created by ben on 15/09/2019.
//  Copyright © 2019 ben. All rights reserved.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var backImageView: UIImageView!
    
    
    @IBOutlet weak var frontImageView: UIImageView!

    //keeps track of the card that should display
    var card: Card?
    
    //a setter
    func setCard(_ card: Card){
        self.card = card
        
        //check if it's matched, if it is,hide them and return, else make them visible
        if card.isMatched == true {
            backImageView.alpha = 0
            frontImageView.alpha = 0
            
            return
        } else {
            backImageView.alpha = 1
            frontImageView.alpha = 1
            
        }
        
        //set the image
        frontImageView.image = UIImage(named: card.imageName)
        
        //Check card's state, is flipped or not
        //if flipped, display front image view
        if card.isFlipped == true {
            UIView.transition(from: backImageView, to: frontImageView, duration: 0, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
        } else {
            //display back image view
            UIView.transition(from: frontImageView, to: backImageView, duration: 0, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
            
        }
    }
    
    func flip (){
        UIView.transition(from: backImageView, to: frontImageView, duration: 0.3, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
    }
    
    //flip back the card with half second delay
    func flipBack(){
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5, execute: {
            UIView.transition(from: self.frontImageView, to: self.backImageView, duration: 0.3, options: [.transitionFlipFromRight, .showHideTransitionViews], completion: nil)
        })
    }
    
    //"removes" cards from being visible when they match
    func remove(){
        backImageView.alpha = 0
        
        UIView.animate(withDuration: 0.3, delay: 0.5, options: .curveEaseOut, animations: {
            self.frontImageView.alpha = 0
        }, completion: nil)
    }
}
