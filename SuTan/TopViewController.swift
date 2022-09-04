//
//  TopViewController.swift
//  SuTan
//
//  Created by Yui Ogawa on 2022/09/02.
//

import UIKit

class TopViewController: UIViewController {
    
    @IBOutlet var bgView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        bgView.layer.cornerRadius = 110
//        bgView.layer.shadowColor = UIColor.gray.cgColor
//        bgView.layer.shadowOffset = CGSize(width: 4.0, height: 2.0)
//        bgView.layer.shadowOpacity = 0.3
        // bgView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMaxYCorner]
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
