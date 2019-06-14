//
//  ViewController.swift
//  PerceptualMap
//
//  Created by Alberto on 07/05/2019.
//  Copyright © 2019 Alberto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var gender : String = " "
    var age : String = " "
    var postcode : String = " "
    
    var cont = 0
    
    var xa = 0.00
    var ya = 0.00
    var xb = 0.00
    var yb = 0.00
    var xc = 0.00
    var yc = 0.00
    var xd = 0.00
    var yd = 0.00
    
    var image1 : UIImageView = UIImageView()
    var image2 : UIImageView = UIImageView()
    var image3 : UIImageView = UIImageView()
    var image4 : UIImageView = UIImageView()
    
    let URL_SAVE = "http://doinkserver.000webhostapp.com/create.php"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var vc = segue.destination as! LastViewController
        vc.gender = self.gender
        vc.age = self.age
        vc.postcode = self.postcode
        
        vc.xa = self.xa
        vc.ya = self.ya
        vc.xb = self.xb
        vc.yb = self.yb
        vc.xc = self.xc
        vc.yc = self.yc
        vc.xd = self.xd
        vc.yd = self.yd
    }
    
    @IBAction func btnback(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func btn2(_ sender: Any) {
        if(cont >= 0){
            cont -= 1
            if(cont == 0){
                image1.image = nil
            }
            else if(cont == 1){
                image2.image = nil
            }
            else if(cont == 2){
                image3.image = nil
            }
            else if(cont == 3){
                image4.image = nil
            }
        }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let location = touch.location(in: self.view)
        var imageName = " "
        if(cont == 0){
            imageName = "child.png"
            xa = Double(location.x-15)
            ya = Double(location.y-25)
            let image = UIImage(named: imageName)
            image1 = UIImageView(image: image!)
            image1.frame = CGRect(x: location.x-15, y: location.y-25, width: 30, height: 50)
            view.addSubview(image1)
            cont += 1
        }
        else if(cont == 1){
            imageName = "adult.png"
            xb = Double(location.x-15)
            yb = Double(location.y-25)
            let image = UIImage(named: imageName)
            image2 = UIImageView(image: image!)
            image2.frame = CGRect(x: location.x-15, y: location.y-25, width: 30, height: 50)
            view.addSubview(image2)
            cont += 1
        }
        else if(cont == 2){
            imageName = "environment.png"
            xc = Double(location.x-15)
            yc = Double(location.y-25)
            let image = UIImage(named: imageName)
            image3 = UIImageView(image: image!)
            image3.frame = CGRect(x: location.x-15, y: location.y-25, width: 30, height: 50)
            view.addSubview(image3)
            cont += 1
        }
        else if(cont == 3){
            imageName = "elderly.png"
            xd = Double(location.x-15)
            yd = Double(location.y-25)
            let image = UIImage(named: imageName)
            image4 = UIImageView(image: image!)
            image4.frame = CGRect(x: location.x-25, y: location.y-25, width: 50, height: 50)
            view.addSubview(image4)
            cont += 1
        }
        else if (cont == 4){
            performSegue(withIdentifier: "last", sender: self)
        }
    }
    
}

