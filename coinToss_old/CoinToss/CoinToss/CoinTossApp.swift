//
//  CoinTossApp.swift
//  CoinToss
//
//  Created by 寺西祐斗 on 2021-07-27.
//

import SwiftUI
import UIKit
//import GoogleMobileAds

// AppDelegateクラスを定義する
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

        // Mobile Ads SDKを初期化する
        //GADMobileAds.sharedInstance().start(completionHandler: nil)
        
        return true
    }
}

@main
struct CoinTossApp: App {
    // SwiftUI AppライフサイクルにAppDelegateクラスを注入する
       @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
       
       var body: some Scene {
           WindowGroup {
               ContentView().environmentObject(PublicManager())
           }
       }
}
