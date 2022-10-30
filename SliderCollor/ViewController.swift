//
//  ViewController.swift
//  SliderCollor
//
//  Created by Lepestok Jora on 28.10.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewCollor: UIView!
  
    @IBOutlet weak var sliderRed: UISlider!
    @IBOutlet weak var sliderGreen: UISlider!
    @IBOutlet weak var sliderBlue: UISlider!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewCollor.layer.cornerRadius = 20
        
        sliderRed.minimumValue = 0
        sliderRed.maximumValue = 1
        
        sliderGreen.minimumValue = 0
        sliderGreen.maximumValue = 1
        
        sliderBlue.minimumValue = 0
        sliderBlue.maximumValue = 1
        createColor()
    }

  
   
    //функция которая принемает значение сладйдеров создать из них цвет и покрасить вью
    
    @IBAction  func createColor() {
        redLabel.text = String(format: "%.2f", sliderRed.value)
        greenLabel.text = String(format: "%.2f", sliderGreen.value)
        blueLabel.text = String(format: "%.2f", sliderBlue.value)
        
        let customeColor: UIColor = UIColor.init(red: CGFloat(sliderRed.value),
                                                 green: CGFloat(sliderGreen.value),
                                                 blue: CGFloat(sliderBlue.value),
                                                 alpha: 1)
        viewCollor.layer.backgroundColor = customeColor.cgColor
        
    }
 

}
    
    

