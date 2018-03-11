//
//  ViewController.swift
//  Rules of Survival Guide
//
//  Created by HungTran on 3/11/18.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {

    @IBAction func btn4Clicked(_ sender: Any) {
        if let link = URL(string: "http://zuneplay.com/gene2/rules-of-survival.html") {
            UIApplication.shared.open(link)
        }
    }
    @IBAction func btn3Clicked(_ sender: Any) {
        openDetailScreen(index: 3)
    }
    @IBAction func btn2Clicked(_ sender: Any) {
        openDetailScreen(index: 2)
    }
    @IBAction func btn1Clicked(_ sender: Any) {
        openDetailScreen(index: 1)
    }
    @IBOutlet var btn4: UIButton!
    @IBOutlet var btn3: UIButton!
    @IBOutlet var btn1: UIButton!
    @IBOutlet var btn2: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        btn1.layer.cornerRadius = 5
        btn1.clipsToBounds = true
        btn2.layer.cornerRadius = 5
        btn2.clipsToBounds = true
        btn3.layer.cornerRadius = 5
        btn3.clipsToBounds = true
        btn4.layer.cornerRadius = 5
        btn4.clipsToBounds = true
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        openAlert()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func openDetailScreen(index: Int){
        let next = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        next.index = index
        self.present(next, animated: true, completion: nil)
    }
    
    func openAlert(){
        let alertController = UIAlertController(title: "Free diamonds", message: "Please give us a 5-star review to get free diamond", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "Get diamonds", style: .default, handler: { (pAlert) in
            self.openRate()
        })
        let closeAction = UIAlertAction(title: "Close", style: .cancel, handler: { (pAlert) in
            alertController.dismiss(animated: true, completion: nil)
        })
        alertController.addAction(defaultAction)
        alertController.addAction(closeAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func openRate(){
        let appID = Bundle.main.bundleIdentifier
        let urlStr = "itms-apps://itunes.apple.com/app/viewContentsUserReviews?id=\(appID)" // (Option 2) Open App Review Tab
        
        
        if let url = URL(string: urlStr), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }


}

