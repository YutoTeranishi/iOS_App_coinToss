//
//  ContentView.swift
//  CoinToss_SwuftUI
//
//  Created by 寺西祐斗 on 2021-08-07.
//

import SwiftUI
import UIKit

let cSideAName:String = "yes_side"
let cSideBName:String = "no_side"
// UIImage インスタンスの生成
let image1:UIImage = UIImage(named:"Gif")!
let gifView = UIImageView(image: image1)
//let gifView = UIImage.gif(name: "yes_no_coinTossing")
let screenSize:CGRect = UIScreen.main.bounds

struct ContentView: View {
    var coin = Coin.init(nameA: cSideAName, nameB: cSideBName)
    //値の更新を反映するために@Stateを追記
    @State var tossingResult:String="yes_side"
    @State var afterGif :Bool = false
    
    var body: some View{
        
        if afterGif{
                Button(action: {
                    tossingResult = coin.gettossingResult()
                }){
                      
                    /*
                        Image("yes_no_coinTossing").resizable()
                    */
                    //gifView.isHidden = false
                    
                    //画面に合わせてコインを作成
                    Image(tossingResult).resizable().scaledToFit()
                   
                }
        }else{
            //画面に合わせてコインを作成
            Image(tossingResult).resizable().scaledToFit()
            //showTheResult()
            
            //フラグを反転
            //afterGif.toggle()
        }
        //i+=1
        
    }
   
}


func showTheResult(){
    //gifView.frame.size.height = screenSize.height * 0.70
    
    gifView.loadGif(name: "yes_no_coinTossing.gif")
    //gifView.isHidden = false
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
