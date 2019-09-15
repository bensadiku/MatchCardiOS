//
//  CardModel.swift
//  MatchCardiOS
//
//  Created by ben on 15/09/2019.
//  Copyright © 2019 ben. All rights reserved.
//

import Foundation

class CardModel {
    
    //generates & returns random pairs
    func getCards() -> [Card]{
        //Declaring a empty card array
        var generatedCardsArray = [Card]()
        //Generating the random pairs, 8 pairs, 16 cards
        for _ in 1...8 {
            
            //gets a random number from 1 to 13
            let randomNumber = arc4random_uniform(13) + 1 //TODO: generate only unique numberes?
            
            print("Generated number: \(randomNumber)")
            
            //creates card 1
            let cardOne = Card()
            cardOne.imageName = "card\(randomNumber)"
            
            generatedCardsArray.append(cardOne)
            
            //creates card 2 with the same randNumber to create a pair
            let cardTwo = Card()
            cardTwo.imageName = "card\(randomNumber)"
            
            generatedCardsArray.append(cardTwo)
            
        }
        //TODO: Randomize the returned array
        return generatedCardsArray
    }
}
