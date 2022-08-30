//
//  ViewController.swift
//  SuTan
//
//  Created by Yui Ogawa on 2022/08/29.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    // ラベルの配置
    @IBOutlet var countLabel: UILabel!
    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var randomNumLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    
    // ボタンの配置
    @IBOutlet var minusButton: UIButton!
    @IBOutlet var plusButton: UIButton!
    
    // 現在のカウント数
    var count: Int = 0
    // ランダムに生成された答えの数
    var randomNum: Int = 0
    // スコア
    var score: Int = 0
    var addScore: Int = 0
    
    // 現在のタイマーの数
    var timeCount: Float = 15.0
    
    // タイマー
    var timer: Timer = Timer()
    
    // サウンと
    let okSoundPlayer = try!AVAudioPlayer(data: NSDataAsset(name: "ok_sound")!.data)

    override func viewDidLoad() {
        super.viewDidLoad()
        // カウントラベルをデザイン
        countLabel.layer.cornerRadius = 90
        countLabel.layer.borderColor = UIColor.white.cgColor
        countLabel.layer.borderWidth = 10
        
        // マイナスボタン, プラスボタンをデザイン
        minusButton.layer.cornerRadius = 40
        plusButton.layer.cornerRadius = 40
        
        // 乱数を生成
        randomNum = Int.random(in: 1...50)
        randomNumLabel.text = String("- \(randomNum) -")
        
        // 最初に加えるスコアを決定
        addScore = randomNum
        
        // スコアを表示
        scoreLabel.text = "\(String(score)) pt"
        
        // タイマーをスタート
        start()
    }
    
    // カウントアップ
    @IBAction func countUp() {
        if count < 50 {
            count = count + 1
            countLabel.text = String(count)
        }
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
        resultVC.score = score
    }
    
    // 「決定する」ボタンが呼ばれたときの動作
    @IBAction func decide() {
        // 数が正解か確かめ、合っていたらscoreとtimerを増加
        if randomNum == count {
            // オッケーの音を巻き戻す
            okSoundPlayer.currentTime = 0
            okSoundPlayer.play()
            
            score = score + addScore
            timeCount = timeCount + 3.0
            
            // 乱数の再生成
            randomNum = Int.random(in: 1...50)
            randomNumLabel.text = String("- \(randomNum) -")
            
            // スコアを表示
            scoreLabel.text = "\(String(score)) pt"
            
            // 次正解時のスコアを決定
            addScore = abs(randomNum - count)
        }
    }
    
    // タイマーをカウントダウンする
    @objc func down() {
        if timeCount > 0 {
            // countから0.01ひく
            timeCount = timeCount - 1.0
            // ラベルに小数点以下2桁まで表示
            timerLabel.text = "\(String(format: "%.0f", timeCount)) 秒"
            
            if timeCount <= 3 {
                timerLabel.textColor = UIColor(red: 223 / 255, green: 160 / 255, blue: 138 / 255, alpha: 1.0)
            } else {
                if timerLabel.textColor == UIColor(red: 223 / 255, green: 160 / 255, blue: 138 / 255, alpha: 1.0){
                    timerLabel.textColor = UIColor.darkGray
                }
            }
        } else {
            decide()
            stop()
            // ResultViewControllerへ移動
            self.performSegue(withIdentifier: "toResult", sender: nil)
        }
    }
    
    // タイマーをスタートする
    func start() {
       // タイマーが作動していなかったら動かす
        if !timer.isValid {
            timer = Timer.scheduledTimer(timeInterval: 1.0,
                                         target: self,
                                         selector: #selector(self.down),
                                         userInfo: nil,
                                         repeats: true)
        }
    }
}

