//
//  ContentView.swift
//  TwoSidesOfCoin
//
//  Created by akira ohmachi on 2021/04/02.
//

import SwiftUI
import ImageIO

struct ContentView: View {
    @EnvironmentObject var pub: PublicManager
    @State private var busyFlag: Bool = false
    @State private var destroyFlag: Bool = false
    @State private var coinImageName: String = "coin_Omote"
    @State private var timeLine: Int = 0
    @State private var coinChoice: Int = 0 //0 or 1
    private var coinList: Array<String> = ["a","b"]
    @State private var coin_val:Int = 0
    
    var body: some View {
        NavigationView {
            GeometryReader { bodyView in
                VStack(spacing: 0) {
                    HStack(spacing: 0) {
                        
                        //Cointossボタン アクション-------------------
                        
                        Button(action:{
                            self.tossCoin()
                            //乱数値表示
                            self.coin_val = coin()
                            print("コイントス結果:\(coin())")
                            
                            if coin_val == 0 {
                                self.coinImageName = "coin_Omote"
                            }else{
                                self.coinImageName = "coin_Ura"
                            }
                           
                        }){
                            Text("Toss A Coin!!")
                                .frame(width:bodyView.size.width / 4 * 3, height:100, alignment: .center)
                                .background(ConstValue.colorStart)
                                .foregroundColor(Color.white)
                        }
                        
                        //Cointossボタン アクション-------------------
                        
                        //SettingView ボタン処理--------------------------
                        Rectangle().fill(Color.white).frame(width: 1,height: 100)
                        NavigationLink(destination: SettingView(),isActive: self.$pub.isSetting) {
                            Button(action:{
                                if (self.busyFlag) {
                                    return
                                }
                                self.pub.tmpSideAratio = self.pub.sideAratio
                                self.pub.tmpSideBratio = self.pub.sideBratio
                                self.pub.isSetting = true
                                
                            }){
                                Text("Setting")
                                    .frame(width:bodyView.size.width / 4, height:100, alignment: .center)
                                    .background(ConstValue.colorSetting)
                                    .foregroundColor(Color.white)
                            }
                        }
                        //SettingView ボタン処理--------------------------
                    }
                    
                    .frame(width:bodyView.size.width, height:100)
                    Rectangle().fill(Color.white).frame(width: bodyView.size.width,height: 1)
                    ZStack(alignment: .bottom) {
                        //コインのimage
                        ScrollView {
                            //デバック用
                            Text("\(coin_val)")
                           
                            Image(self.coinImageName)
                                .resizable()
                                .frame(width:bodyView.size.width, height:bodyView.size.width, alignment: .center)
                            Spacer(minLength: 150)
                            
                            
                        }
                        /* 広告表示
                        HStack(spacing: 0) {
                            Spacer(minLength: 0)
                            PublicManager.AdView().frame(maxWidth: bodyView.size.width, maxHeight: 50)
                            Spacer(minLength: 0)
                        }.background(Color(red:0.2,green:0.2,blue:0.2))
                        */
                    }
                }
                .background(ConstValue.colorBg)
                //.navigationBarTitle("")
                .navigationBarHidden(true)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onDisappear {     //アプリ終了時
            self.destroyFlag = true
        }
    }
    
    func coin() -> Int {
        
        let side = Bool.random()
        
        if side == true{
            return 1
        }else{
            return 0
        }
        
        /* 1~10までの乱数
        let num = Int.random(in:1..<11)
        return num
        */
    }
    
    //Toss a coin button on click
    func tossCoin() {
        if self.busyFlag {
            return
        }
        self.busyFlag = true
        //set a coinChoice
        let ratioA: Int = NumberFormatter().number(from: "0" + pub.sideAratio) as! Int
        let ratioB: Int = NumberFormatter().number(from: "0" + pub.sideBratio) as! Int
        let sumRatio: Int = ratioA + ratioB
        self.coinChoice = 0
        if Int.random(in: 0..<sumRatio) >= ratioA {
            self.coinChoice = 1
        }
        //
        self.timeLine = 0
        self.timeLineAnimation()
    }

    //coin animation
    func timeLineAnimation() {
        withAnimation {
            if self.destroyFlag {
                return
            }
            self.timeLine += 1
            if self.timeLine > 120 {
                self.busyFlag = false
                return
            }
            self.setImageName()
            DispatchQueue.global().async {
                Thread.sleep(forTimeInterval: 0.02)
                DispatchQueue.main.sync {
                    if self.destroyFlag == false {
                        self.timeLineAnimation()
                    }
                }
            }
        }
    }

    //set coin image
    func setImageName() {
        /*
        self.coinImageName = "coin_" + self.coinList[self.coinChoice] + "_" + "XXX"//String(format: "%03d",self.timeLine)
        */
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(PublicManager())
    }
}
