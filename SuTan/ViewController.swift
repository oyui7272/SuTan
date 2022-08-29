//
//  ViewController.swift
//  SuTan
//
//  Created by Yui Ogawa on 2022/08/29.
//

import UIKit

class ViewController: UIViewController {

    // 現在のカウント数, 残り時間を表示するラベルの配置
    @IBOutlet var countLabel: UILabel!
    @IBOutlet var timerLabel: UILabel!
    
    // ボタンの配置
    @IBOutlet var minusButton: UIButton!
    @IBOutlet var plusButton: UIButton!
    
    // 現在のカウント数
    var count: Int = 0
    // ランダムに生成された答えの数
    var randomNum: Int = 0
    
    // 現在のタイマーの数
    var timeCount: Float = 10.0
    // タイマー
    var timer: Timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // カウントラベルをデザインする
        countLabel.layer.cornerRadius = 100
        countLabel.layer.borderColor = UIColor(red: 223, green: 160, blue: 138, alpha: 1).cgColor
        countLabel.layer.borderWidth = 8
        
        // マイナスボタン, プラスボタンをデザインする
        minusButton.layer.cornerRadius = 40
        plusButton.layer.cornerRadius = 40
        
        // 乱数を生成する
        randomNum = Int.random(in: 0...100)
        print("randomNum： \(randomNum)")
        
        // タイマーをスタートする
        start()
    }
    
    // カウントアップ
    @IBAction func countUp() {
        count = count + 1
        countLabel.text = String(count)
    }
    
    // カウントダウン
    @IBAction func countDown() {
        if count > 0 {
            count = count - 1
            countLabel.text = String(count)
        }
    }
    
    // タイマーをストップする
    func stop() {
        if timer.isValid {
            timer.invalidate()
        }
    }
    
    // 次の画面へ値渡しをする
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 次の画面を変数化する
        let resultVC = segue.destination as! ResultViewController
        
        // 渡したい値
        resultVC.score = 100 - abs(randomNum - count)
        resultVC.randomNum = randomNum
        resultVC.yourNum = count
    }
    
    // 「決定する」ボタンが呼ばれたときの動作
    @IBAction func decide() {
        stop()
    }
    
    // タイマーをカウントダウンする
    @objc func down() {
        if timeCount > 0 {
            // countから0.01ひく
            timeCount = timeCount - 0.1
            // ラベルに小数点以下2桁まで表示
            timerLabel.text = "残り\(String(format: "%.1f", timeCount))秒"
        } else {
            decide()
            // ResultViewControllerへ移動
            self.performSegue(withIdentifier: "toResult", sender: nil)
        }
    }
    
    // タイマーをスタートする
    func start() {
       // タイマーが作動していなかったら動かす
        if !timer.isValid {
            timer = Timer.scheduledTimer(timeInterval: 0.1,
                                         target: self,
                                         selector: #selector(self.down),
                                         userInfo: nil,
                                         repeats: true)
        }
    }
}

