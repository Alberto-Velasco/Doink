//
//  InputViewController.swift
//  PerceptualMap
//
//  Created by Alberto on 14/05/2019.
//  Copyright © 2019 Alberto. All rights reserved.
//

import UIKit

class InputViewController: UIViewController {
    var gender : String = ""
    var age : String = ""
    var postcode : String = ""

    @IBAction func btnBack(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
    }
    @IBOutlet weak var txtGender: UITextField!
    @IBOutlet weak var txtAge: UITextField!
    @IBOutlet weak var txtPostcode: UITextField!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var vc = segue.destination as! ViewController
        vc.gender = self.gender
        vc.age = self.age
        vc.postcode = self.postcode
    }
    
    @IBOutlet var checkBox_Collection: [UIButton]!
    
    @IBAction func CheckBox_Clicked(_ sender: UIButton) {
        sender.setImage(UIImage(named: "check-box-empty"), for: UIControl.State.normal)
        sender.setImage(UIImage(named: "check-box"), for: UIControl.State.selected)
        sender.isSelected = !(sender.isSelected)
        checkBox_Collection.forEach { word in
            if(word.isSelected){
                gender = word.titleLabel!.text!
            }
        }
    }
    
    @IBAction func btnOk(_ sender: UIButton) {
        age = txtAge.text!
        postcode = txtPostcode.text!
        if(age.isEmpty || postcode.isEmpty  || gender.isEmpty){
            var alert: UIAlertView = UIAlertView(title: "Error", message: "Please fill all the fields...", delegate: nil, cancelButtonTitle: "Ok");
            alert.show()
        }
        else{
            txtAge.text = " "
            txtPostcode.text = " "
            performSegue(withIdentifier: "second", sender: self)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
