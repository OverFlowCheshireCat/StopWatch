// Codes By. Yotta

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var clock: UILabel!

    var mTimer = Timer()
    
    var hour = 0, minute = 0, second = 0, cSecond = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func calcTime() {
        if (cSecond != 99) {
            cSecond += 1;
        } else {
            cSecond = 0
            
            if (second != 59) {
                second += 1;
            } else {
                second = 0;
                
                if (minute != 59) {
                    minute += 1;
                } else {
                    minute = 0;
                    
                    if (hour != 99) {
                        hour += 1;
                    } else {
                        hour = 0;
                    }
                }
            }
        }
        
        clock.text = (hour < 10 ? "0" + String(hour) : String(hour)) + ":" + (minute < 10 ? "0" + String(minute) : String(minute)) + ":" + (second < 10 ? "0" + String(second) : String(second)) + "." + (cSecond < 10 ? "0" + String(cSecond) : String(cSecond))
    }
    
    @IBAction func play(_ sender: Any) {
        if (!mTimer.isValid) {
            mTimer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { timer in self.calcTime() })
        }
    }
    
    @IBAction func pause(_ sender: Any) {
        mTimer.invalidate()
    }
    
    @IBAction func stop(_ sender: Any) {
        mTimer.invalidate()
        
        hour = 0;
        minute = 0;
        second = 0;
        
        clock.text = "00:00:00.00"
    }
}
