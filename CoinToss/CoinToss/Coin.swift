//
//  Coin.swift
//  CoinToss
//
//  Created by 寺西祐斗 on 2021-08-05.
//

import Foundation

class Coin{
    private var side_A:String = ""
    private var side_B:String = ""
    
    init(nameA:String,nameB:String) {
        side_A = nameA
        side_B = nameB
    }
    
    func setSides(nameA:String,nameB:String) {
        
        self.side_A = nameA
        self.side_B = nameB
    }
    
    func getSideA() -> String {
        return self.side_A
    }
    
    func getSideB() -> String {
        return self.side_B
    }
    
    func gettossingResult() ->  String{
        let showUpSide:String
        
        if Bool.random(){
            showUpSide = getSideA()
        }else{
            showUpSide = getSideB()
        }
        return showUpSide
    }
    
}
