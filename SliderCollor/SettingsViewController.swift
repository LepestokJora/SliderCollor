

import UIKit

protocol SentMyColor {
    func callback(_ myProtocolColor: UIColor)
}



class SettingsViewController: UIViewController {

    
    var myProtocolColor: UIColor!
    var delegate: SentMyColor?
    
    @IBOutlet weak var viewCollor: UIView!
    
    @IBOutlet weak var sliderRed: UISlider!
    @IBOutlet weak var sliderGreen: UISlider!
    @IBOutlet weak var sliderBlue: UISlider!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    
    @IBOutlet weak var sliderOneTF: UITextField!
    @IBOutlet weak var sliderTwoTF: UITextField!
    @IBOutlet weak var sliderThreeTF: UITextField!
    
    
    
   // var customeColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewCollor.layer.cornerRadius = 20
        
        sliderRed.minimumValue = 0
        sliderRed.maximumValue = 1
        sliderRed.value = Float(myProtocolColor?.rgb()?.red ?? 0) / 255
        sliderOneTF.text = String(format: "%.2f", sliderRed.value)
        
        sliderGreen.minimumValue = 0
        sliderGreen.maximumValue = 1
        sliderGreen.value = Float(myProtocolColor?.rgb()?.green ?? 0) / 255
        sliderTwoTF.text = String(format: "%.2f", sliderGreen.value)
        
        sliderBlue.minimumValue = 0
        sliderBlue.maximumValue = 1
        sliderBlue.value = Float(myProtocolColor?.rgb()?.blue ?? 0) / 255
        sliderThreeTF.text = String(format: "%.2f", sliderBlue.value)
        
        viewCollor.backgroundColor = myProtocolColor
        
        hideKeyboardWhenTappedAround()
        }

    
    override func viewWillDisappear(_ animated: Bool) {
        delegate?.callback(myProtocolColor)
    }
    
    
    //TODO: вижу повторяющиеся код, буду оптимизировать
    
    @IBAction  func createColor() {
        redLabel.text = String(format: "%.2f", sliderRed.value)
        greenLabel.text = String(format: "%.2f", sliderGreen.value)
        blueLabel.text = String(format: "%.2f", sliderBlue.value)
        
        sliderOneTF.text = String(format: "%.2f", sliderRed.value)
        sliderTwoTF.text = String(format: "%.2f", sliderGreen.value)
        sliderThreeTF.text = String(format: "%.2f", sliderBlue.value)
        
        myProtocolColor = UIColor.init(red: CGFloat(sliderRed.value),
                                                 green: CGFloat(sliderGreen.value),
                                                 blue: CGFloat(sliderBlue.value),
                                                 alpha: 1)
        viewCollor.backgroundColor = myProtocolColor
        
    }
    
}
    

extension UIColor {

    func rgb() -> (red:Int, green:Int, blue:Int, alpha:Int)? {
        var fRed : CGFloat = 0
        var fGreen : CGFloat = 0
        var fBlue : CGFloat = 0
        var fAlpha: CGFloat = 0
        if self.getRed(&fRed, green: &fGreen, blue: &fBlue, alpha: &fAlpha) {
            let iRed = Int(fRed * 255.0)
            let iGreen = Int(fGreen * 255.0)
            let iBlue = Int(fBlue * 255.0)
            let iAlpha = Int(fAlpha * 255.0)

            return (red:iRed, green:iGreen, blue:iBlue, alpha:iAlpha)
        } else {
            // Could not extract RGBA components:
            return nil
        }
    }

}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    
    
}
