// Codes By. Yotta

import UIKit;

class ViewController: UIViewController {
    @IBOutlet weak var clock: UILabel!;

    @IBOutlet weak var playBtn: UIBarButtonItem!;
    @IBOutlet weak var pauseBtn: UIBarButtonItem!;
    @IBOutlet weak var stopBtn: UIBarButtonItem!;
    
    var mTimer = Timer();
    
    var hour = 0, minute = 0, second = 0, cSecond = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        changeBtnStatus(play: true, pause: false, stop: false);
    }
    
    func changeBtnStatus(play: Bool, pause: Bool, stop: Bool) {
        playBtn.isEnabled = play;
        pauseBtn.isEnabled = pause;
        stopBtn.isEnabled = stop;
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
        
        clock.text = (hour < 10 ? "0" + String(hour) : String(hour)) + ":" + (minute < 10 ? "0" + String(minute) : String(minute)) + ":" + (second < 10 ? "0" + String(second) : String(second)) + "." + (cSecond < 10 ? "0" + String(cSecond) : String(cSecond));
    }
    
    @IBAction func play(_ sender: Any) {
        mTimer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { timer in self.calcTime() })
        
        changeBtnStatus(play: false, pause: true, stop: true);
    }
    
    @IBAction func pause(_ sender: Any) {
        mTimer.invalidate();
        
        changeBtnStatus(play: true, pause: false, stop: true);
    }
    
    @IBAction func stop(_ sender: Any) {
        mTimer.invalidate();
        
        hour = 0;
        minute = 0;
        second = 0;
        
        clock.text = "00:00:00.00";
        
        changeBtnStatus(play: true, pause: false, stop: false);
    }
}
