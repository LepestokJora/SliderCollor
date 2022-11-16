
import UIKit

class CollorStartViewController: UIViewController, SentMyColor {
    
    var delegate: SentMyColor?
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let settingsViewController = segue.destination as? SettingsViewController {
            settingsViewController.myProtocolColor = view.backgroundColor
            settingsViewController.delegate = self
          
        }
        
    }
    func callback(_ myProtocolColor: UIColor) {
        self.view.backgroundColor = myProtocolColor
    }
    
}
    
    
    

