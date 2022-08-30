//
//  ResultViewController.swift
//  SuTan
//
//  Created by Yui Ogawa on 2022/08/29.
//

import UIKit

class ResultViewController: UIViewController {
    
    var score: Int = 0
    
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var yourNumLabel: UILabel!
    @IBOutlet var randomNumLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("score: \(String(score))")
        // 得点ラベルの表示
        scoreLabel.layer.cornerRadius = 90
        scoreLabel.layer.borderColor = UIColor.white.cgColor
        scoreLabel.layer.borderWidth = 10
        scoreLabel.text = String(score)
    }
    
    @IBAction func goTop(){
        self.presentingViewController?.presentingViewController?.dismiss(animated: false, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
