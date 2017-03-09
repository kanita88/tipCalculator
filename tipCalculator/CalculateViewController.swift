//
//  CalculateViewController.swift
//  tipCalculator
//
//  Created by etudiant-07 on 02/03/2017.
//  Copyright © 2017 Kanita. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var checkAmountLabel: UILabel!
    
    @IBOutlet weak var checkAmountTextField: UITextField!
    
    @IBOutlet weak var serviceLabel: UILabel!
    
    @IBOutlet weak var buttonFirst: UIButton!
    
    @IBOutlet weak var buttonSecond: UIButton!
    
    @IBOutlet weak var buttonThird: UIButton!
    
    @IBOutlet weak var amountLabel: UILabel!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var segmentedControlCurrency: UISegmentedControl!
    
    
    
//crer variable et ajouter un calculateModel
    var brain = CalculatorModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        self.checkAmountLabel.text = "Check Amount"
        self.checkAmountTextField.text = "0.0"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func serviceButtonTapped(_ sender: UIButton) {
       print("button \(sender.tag)")

       brain.serviceLevel = sender.tag
        let imagePleine = #imageLiteral(resourceName: "fleche_pleine")
        let imageVide = #imageLiteral(resourceName: "fleche_creuse")
        
//        switch sender.tag {
//        case 0 :
//            self.serviceLabel.text = "Service excellent 10%"
//            self.buttonFirst.setImage(imagePleine, for: .normal)
//            self.buttonSecond.setImage(imageVide, for: .normal)
//            self.buttonThird.setImage(imageVide, for: .normal)
//        case 1 :
//            self.serviceLabel.text = "Service excellent 15%"
//            self.buttonFirst.setImage(imagePleine, for: .normal)
//            self.buttonSecond.setImage(imagePleine, for: .normal)
//            self.buttonThird.setImage(imageVide, for: .normal)
//        case 2 :
//            self.serviceLabel.text = "Service excellent 20%"
//            self.buttonFirst.setImage(imagePleine, for: .normal)
//            self.buttonSecond.setImage(imagePleine, for: .normal)
//            self.buttonThird.setImage(imagePleine, for: .normal)
//            
//         default :
//            break
//        }
        self.buttonFirst.setImage(imagePleine, for: .normal)
        self.buttonSecond.setImage(brain.serviceLevel >= 1 ? imagePleine : imageVide, for: .normal)
        self.buttonThird.setImage(brain.serviceLevel >= 2 ? imagePleine: imageVide, for: .normal)
        
            if let amount = checkAmountTextField.text , let formattedAmount = stringToDouble(amount) {

                brain.checkAmount = formattedAmount
                print("amount is \(brain.computedTip)")
                self.amountLabel.text = "\(brain.computedTip) €"
                self.serviceLabel.text = brain.serviceLabelText
                
       
        }
    
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
//    @IBAction func segmentedEuroDollar(_ sender: UISegmentedControl) {
//        print("device \(sender.selectedSegmentIndex)")
//        
//        switch sender.selectedSegmentIndex {
//        case 0 :
//            self.checkAmountTextField.text = "€"
//        case 1 :
//            self.checkAmountTextField.text = "$"
//        default:
//            break
//        }
//        
//    }
    
//    @IBAction func backButtonClicked(_ sender: UIButton) {
//        print(" BACK BUTTON CLICKED")
//        self.dismiss(animated: true, completion: nil)
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    }
