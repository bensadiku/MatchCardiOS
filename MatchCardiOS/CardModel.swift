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
        //Declaring a array to keep the generated numbers
        var generatedNumbersArray = [Int]()
        
        //Declaring a empty card array
        var generatedCardsArray = [Card]()
        //Generating the random pairs, 8 pairs, 16 cards
        while generatedNumbersArray.count < 8{
            
            //gets a random number from 1 to 13
            let randomNumber = arc4random_uniform(13) + 1
            if generatedNumbersArray.contains(Int(randomNumber)) == false {
                
                print("Generated number: \(randomNumber)")
                
                //store into the generatedNumbersArray
                generatedNumbersArray.append(Int(randomNumber))
                
                //creates card 1
                let cardOne = Card()
                cardOne.imageName = "card\(randomNumber)"
                
                generatedCardsArray.append(cardOne)
                
                //creates card 2 with the same randNumber to create a pair
                let cardTwo = Card()
                cardTwo.imageName = "card\(randomNumber)"
                
                generatedCardsArray.append(cardTwo)
                
            }
            for i in 0...generatedCardsArray.count-1 {
                
                //random number to swap
                let secondRandomNumber =    Int(arc4random_uniform(UInt32(generatedCardsArray.count)))
            
                //Swap cards
                let temporaryStorage = generatedCardsArray[i]
                generatedCardsArray[i] = generatedCardsArray[secondRandomNumber]
                generatedCardsArray[secondRandomNumber] = temporaryStorage
            }
            
        }
        //TODO: Randomize the returned array
        return generatedCardsArray
    }
}
