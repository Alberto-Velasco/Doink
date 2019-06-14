//
//  LastViewController.swift
//  PerceptualMap
//
//  Created by Alberto on 17/05/2019.
//  Copyright © 2019 Alberto. All rights reserved.
//

import UIKit

class LastViewController: UIViewController {
    var gender : String = " "
    var age : String = " "
    var postcode : String = " "
    var q1 : String = " "
    var q2 : String = " "
    
    var cont = 0
    
    var xa = 0.00
    var ya = 0.00
    var xb = 0.00
    var yb = 0.00
    var xc = 0.00
    var yc = 0.00
    var xd = 0.00
    var yd = 0.00
    
    @IBOutlet weak var txtq1: UITextView!
    @IBOutlet weak var txtq2: UITextView!
    @IBAction func btnBack(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func btnOk(_ sender: UIButton) {
        q1 = txtq1.text!
        q2 = txtq2.text!
        
        let URL_SAVE = "http://doinkserver.000webhostapp.com/create.php"
        
        let requestURL = NSURL(string: URL_SAVE)
        
        let request = NSMutableURLRequest(url: requestURL! as URL)
        
        request.httpMethod = "POST"
        
        var postParameters = "age="+age
        postParameters += "&gender="+gender
        postParameters += "&postcode="+postcode
        postParameters += "&xa="+String(xa)
        postParameters += "&ya="+String(ya)
        postParameters += "&xb="+String(xb)
        postParameters += "&yb="+String(yb)
        postParameters += "&xc="+String(xc)
        postParameters += "&yc="+String(yc)
        postParameters += "&xd="+String(xd)
        postParameters += "&yd="+String(yd)
        postParameters += "&q1="+String(q1)
        postParameters += "&q2="+String(q2)
        
        
        request.httpBody = postParameters.data( using: String.Encoding.utf8)
        
        let task = URLSession.shared.dataTask(with: request as URLRequest){
            data, response, error in
            
            if error != nil{
                print("error is \(String(describing: error))")
                return;
            }
            //parsing the response
            do {
                //converting resonse to NSDictionary
                let myJSON =  try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                
                //parsing the json
                if let parseJSON = myJSON {
                    
                    //creating a string
                    var msg : String!
                    
                    //getting the json response
                    msg = parseJSON["message"] as! String?
                    
                    //printing the response
                    print(msg)
                    self.dismiss(animated: true, completion: nil)
                }
            } catch {
                var alert: UIAlertView = UIAlertView(title: "Error", message: "Something went bad", delegate: nil, cancelButtonTitle: "Ok");
                alert.show()
                print(error)
            }
            
        }
        //executing the task
        task.resume()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
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
