//
//  SecondViewController.swift
//  PerceptualMap
//
//  Created by Alberto on 08/05/2019.
//  Copyright © 2019 Alberto. All rights reserved.
//

import UIKit

class Resul {
    
    var gender = " "
    var age = 0
    var postcode = " "
    var xa = " "
    var ya = " "
    var xb = " "
    var yb = " "
    var xc = " "
    var yc = " "
    var xd = " "
    var yd = " "
    var q1 = " "
    var q2 = " "
    
    init(){
        
    }
}

class SecondViewController: UIViewController {
    var list = [Resul]()
    var current = 0
    var res = Resul()
    
    var image1 : UIImageView = UIImageView()
    var image2 : UIImageView = UIImageView()
    var image3 : UIImageView = UIImageView()
    var image4 : UIImageView = UIImageView()
    
    @IBAction func btn2(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
        var current = 0
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ThirdViewController
        destinationVC.q1 = res.q1
        destinationVC.q2 = res.q2
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        performSegue(withIdentifier: "third", sender: self)
    }
    
    func clear () {
        image1.image = nil
        image2.image = nil
        image3.image = nil
        image4.image = nil
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        var imageName = " "
        var x = " "
        var y = " "
        for n in 1...4 {
            if(n == 1){
                imageName = "child.png"
                x = res.xa
                y = res.ya
                let image = UIImage(named: imageName)
                image1 = UIImageView(image: image!)
                image1.frame = CGRect(x: Double(x)!, y: Double(y)!, width: 30, height: 50)
                view.addSubview(image1)
            }
            if(n == 2){
                imageName = "adult.png"
                x = res.xb
                y = res.yb
                let image = UIImage(named: imageName)
                image2 = UIImageView(image: image!)
                image2.frame = CGRect(x: Double(x)!, y: Double(y)!, width: 30, height: 50)
                view.addSubview(image2)
            }
            if(n == 3){
                imageName = "environment.png"
                x = res.xc
                y = res.yc
                let image = UIImage(named: imageName)
                image3 = UIImageView(image: image!)
                image3.frame = CGRect(x: Double(x)!, y: Double(y)!, width: 30, height: 50)
                view.addSubview(image3)
            }
            if(n == 4){
                imageName = "elderly.png"
                x = res.xd
                y = res.yd
                let image = UIImage(named: imageName)
                image4 = UIImageView(image: image!)
                image4.frame = CGRect(x: Double(x)!, y: Double(y)!, width: 50, height: 50)
                view.addSubview(image4)
            }
        }
    }
    
}
