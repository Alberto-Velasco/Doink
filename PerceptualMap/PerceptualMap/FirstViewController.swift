//
//  FirstViewController.swift
//  PerceptualMap
//
//  Created by Alberto on 14/05/2019.
//  Copyright © 2019 Alberto. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    var list = [Resul]()
    var gender : String = " "
    var current = 0
    
    @IBAction func btnBack(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
    }
    @IBOutlet weak var txtGender: UITextField!
    @IBOutlet weak var txtAge: UITextField!
    @IBOutlet weak var txtPostcode: UITextField!
    
    @IBAction func btnPrevious(_ sender: UIButton) {
        if(current > 0){
            current -= 1
            txtGender.text = list[current].gender
            txtAge.text = String(list[current].age)
            txtPostcode.text = list[current].postcode
        }
        else{
            txtGender.text = list[current].gender
            txtAge.text = String(list[current].age)
            txtPostcode.text = list[current].postcode
        }
    }
    @IBAction func btnNext(_ sender: UIButton) {
        if(current < (list.count)-1 && current != 0){
            txtGender.text = list[current].gender
            txtAge.text = String(list[current].age)
            txtPostcode.text = list[current].postcode
            current += 1
        }
        else if(current == 0){
            txtGender.text = list[current].gender
            txtAge.text = String(list[current].age)
            txtPostcode.text = list[current].postcode
            current += 1
        }
        else if(current < list.count){
            txtGender.text = list[current].gender
            txtAge.text = String(list[current].age)
            txtPostcode.text = list[current].postcode
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! SecondViewController
        destinationVC.res.xa = list[current].xa
        destinationVC.res.ya = list[current].ya
        destinationVC.res.xb = list[current].xb
        destinationVC.res.yb = list[current].yb
        destinationVC.res.xc = list[current].xc
        destinationVC.res.yc = list[current].yc
        destinationVC.res.xd = list[current].xd
        destinationVC.res.yd = list[current].yd
        destinationVC.res.q1 = list[current].q1
        destinationVC.res.q2 = list[current].q2
    }
    
    @IBAction func btnOK(_ sender: UIButton) {
        performSegue(withIdentifier: "first", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        var alert: UIAlertView = UIAlertView(title: "Loading", message: "Please wait...", delegate: nil, cancelButtonTitle: "Cancel");
        
        let loadingIndicator: UIActivityIndicatorView = UIActivityIndicatorView() as UIActivityIndicatorView
        loadingIndicator.center = self.view.center;
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.gray
        loadingIndicator.startAnimating();
        
        alert.setValue(loadingIndicator, forKey: "accessoryView")
        loadingIndicator.startAnimating()
        
        alert.show()
        txtAge.isEnabled =  false
        txtAge.isUserInteractionEnabled = false
        txtGender.isEnabled =  false
        txtGender.isUserInteractionEnabled = false
        txtPostcode.isEnabled =  false
        txtPostcode.isUserInteractionEnabled = false
        let url = URL(string: "http://doinkserver.000webhostapp.com/get_all.php")!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let dataResponse = data,
                error == nil else {
                    print(error?.localizedDescription ?? "Response Error")
                    return }
            do{
                let jsonResponse = try JSONSerialization.jsonObject(with:
                    dataResponse, options: []) as! NSDictionary
                if let results = jsonResponse["results"]! as? [[String : AnyObject]] {
                    for result in results {
                        let rs : Resul = Resul()
                        rs.gender = result["gender"]! as! String
                        rs.age = Int((result["age"]!as! NSString).intValue)
                        rs.postcode = result["postcode"]! as! String
                        rs.xa = result["xa"]! as! String
                        rs.ya = result["ya"]! as! String
                        rs.xb = result["xb"]! as! String
                        rs.yb = result["yb"]! as! String
                        rs.xc = result["xc"]! as! String
                        rs.yc = result["yc"]! as! String
                        rs.xd = result["xd"]! as! String
                        rs.yd = result["yd"]! as! String
                        rs.q1 = result["q1"]! as! String
                        rs.q2 = result["q2"]! as! String
                        print(rs.age)
                        self.list.append(rs)
                    }
                    alert.dismiss(withClickedButtonIndex: -1, animated: true)
                }
                
                
            } catch let parsingError {
                print("Error", parsingError)
            }
        }
        task.resume()
        
    }
    

}
