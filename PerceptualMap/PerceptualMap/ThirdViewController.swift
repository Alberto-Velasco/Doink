//
//  ThirdViewController.swift
//  PerceptualMap
//
//  Created by Alberto on 17/05/2019.
//  Copyright © 2019 Alberto. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    @IBOutlet weak var txtq1: UITextView!
    @IBOutlet weak var txtq2: UITextView!
    
    var q1 : String = " "
    var q2 : String = " "
    
    @IBAction func btnBack(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        txtq1.isUserInteractionEnabled = false
        txtq2.isUserInteractionEnabled = false
        txtq1.text = q1
        txtq2.text = q2
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
