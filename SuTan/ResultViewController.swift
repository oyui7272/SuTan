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
    @IBOutlet var scoreBgView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("score: \(String(score))")
        // 得点ラベルの表示
        scoreBgView.layer.cornerRadius = 110
//        scoreBgView.layer.shadowColor = UIColor.gray.cgColor
//        scoreBgView.layer.shadowOffset = CGSize(width: 4.0, height: 2.0)
//        scoreBgView.layer.shadowOpacity = 0.3
        scoreLabel.text = String(score)
    }
    
    @IBAction func goTop(){
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
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
