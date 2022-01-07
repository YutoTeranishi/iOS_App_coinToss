//
//  ViewController.swift
//  CoinToss
//
//  Created by 寺西祐斗 on 2021-08-05.
//

import UIKit
import ImageIO

class ViewController: UIViewController {
    //@IBOutlet var GifView: UIImageView!
    
    @IBOutlet weak var ResultView: UIImageView!
    @IBOutlet weak var GifView: UIImageView!
    @IBOutlet weak var TossingButton: UIButton!
    private let coin = Coin(nameA:" ", nameB:" ")//Coinクラスのインスタンス生成
    
    override func viewDidLoad() {
        
        //各種デバイス画面サイズに合わせてViewを設定
        let rect:CGRect = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        let buttonRect:CGRect = CGRect(x: view.frame.midX-100, y: view.frame.midY, width: UIScreen.main.bounds.width * 0.25, height: UIScreen.main.bounds.height * 0.25)
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //ResultViewの大きさ指定
        ResultView.frame = rect
        
        //結果表示用のView(初期設定)
        ResultView.isHidden = true
        
        //コインの両面の画像を指定
        coin.setSides(nameA:"yes_side", nameB: "no_side")
        
        
        //GifView
       
        GifView.frame = rect
        GifView.isHidden = true
        GifView.loadGif(name: "yes_no_coinTossing")
        
        //ボタンの位置を設定
        TossingButton.frame = buttonRect
        
    }
    

    
    @IBAction func Tossing(_ sender: Any) {
        //二回目以降
        ResultView.isHidden = true
     
        GifView.isHidden = false
        //コイントスの結果をViewに格納
        ResultView.image = UIImage(named:coin.gettossingResult())
        
        
        //コイントスのアニメーションを止めて結果を表示
        DispatchQueue.main.asyncAfter(deadline: .now()+1.5){
            self.GifView.isHidden = true
            self.ResultView.isHidden = false
        }
        
        
    }
    func Tossing2(_ sender: Any) {
        //二回目以降
        ResultView.isHidden = true
     
        GifView.isHidden = false
        //コイントスの結果をViewに格納
        ResultView.image = UIImage(named:coin.gettossingResult())
        
        
        //コイントスのアニメーションを止めて結果を表示
        DispatchQueue.main.asyncAfter(deadline: .now()+1.5){
            self.GifView.isHidden = true
            self.ResultView.isHidden = false
        }
        
        
    }
    
}

