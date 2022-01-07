

//
//  PublicManager.swift
//  TwoSidesOfCoin
//
//  Created by akira ohmachi on 2021/04/02.
//

import SwiftUI
//import GoogleMobileAds

class PublicManager: ObservableObject {
    
    @AppStorage("sideAratio") var sideAratio: String = "1"
    @AppStorage("sideBratio") var sideBratio: String = "1"
    @Published var isSetting: Bool = false
    
    @Published var tmpSideAratio: String = ""
    @Published var tmpSideBratio: String = ""

    //--------------------------------------------------
    //adMob
    /*
    struct AdView: UIViewRepresentable {
        func makeUIView(context: Context) -> GADBannerView {
            let banner = GADBannerView(adSize: kGADAdSizeBanner)
            #if DEBUG
            banner.adUnitID = "ca-app-pub-3940256099942544/2934735716"
            #else
            banner.adUnitID = "ca-app-pub-0000000000000000/0000000000"
            #endif
            banner.rootViewController = UIApplication.shared.windows.first?.rootViewController
            banner.load(GADRequest())
            return banner
        }

        func updateUIView(_ uiView: GADBannerView, context: Context) {
        }
    }
    */
    //--------------------------------------------------

}
