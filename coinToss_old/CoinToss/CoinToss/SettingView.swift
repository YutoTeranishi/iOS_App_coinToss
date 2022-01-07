//
//  SettingView.swift
//  TwoSidesOfCoin
//
//  Created by akira ohmachi on 2021/04/02.
//

import SwiftUI

struct SettingView: View {
    @EnvironmentObject var pub: PublicManager
    
    var body: some View {
        VStack() {
            HStack {
                Button(action: {
                    pub.isSetting = false
                }) {
                    HStack {
                        Image(systemName: "arrow.backward")
                        Text("Cancel")
                    }
                }
                Spacer()
                Button(action: {
                    self.pub.sideAratio = self.adjustStrNum(str: self.pub.tmpSideAratio)
                    self.pub.sideBratio = self.adjustStrNum(str: self.pub.tmpSideBratio)
                    pub.isSetting = false
                }) {
                    HStack {
                        Text("Apply")
                        Image(systemName: "checkmark.circle")
                    }
                }
            }
            .padding(20)
        }
        Form {
            Section(header: Text("Ratio_Of_Side_A")) {
                TextField("", text: Binding(
                    get: {pub.tmpSideAratio},
                    set: {pub.tmpSideAratio = $0.filter{"0123456789".contains($0)}}))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
            }
            Section(header: Text("Ratio_Of_Side_B")) {
                TextField("", text: Binding(
                    get: {pub.tmpSideBratio},
                    set: {pub.tmpSideBratio = $0.filter{"0123456789".contains($0)}}))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
            }
            Text("Usage")
                .font(.footnote)
        }
        //.navigationBarTitle("Setting",displayMode: .automatic)
        //.navigationViewStyle(StackNavigationViewStyle())
        .navigationBarHidden(true)
        .onTapGesture {     //背景タップでキーボードを閉じる
            UIApplication.shared.closeKeyboard()
        }

    }
    
    func adjustStrNum(str: String) -> String {
        var num: Int = NumberFormatter().number(from: "0" + str) as! Int
        if num == 0 {
            num = 1
        }
        return String(num)
    }
}

extension UIApplication {
    func closeKeyboard() {  //キーボードを閉じる
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SettingView().environmentObject(PublicManager())
        }
    }
}
