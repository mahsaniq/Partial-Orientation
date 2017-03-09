//
//  AllOrientationViewController.swift
//  Partial Orientation
//
//  Created by Muhammad Ahsan Iqbal on 07/03/2017.
//  Copyright © 2017 Creative Chaos (Pvt.) Ltd. All rights reserved.
//

import UIKit

@objc protocol InterfaceOrientationAllButUpsideDown {

    func supportingInterfaceOrientationAllButUpsideDown()

}

class AllOrientationViewController: UIViewController, InterfaceOrientationAllButUpsideDown {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")

    }

    /**
     For presenting modally:
    @IBAction func didDismissButtonPress(sender: UIButton) {

        self.dismiss(animated: true) { () -> Void in

            UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")

        }

    }
     */

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Method used for supporting interface orientation .AllButUpsideDown
    internal func supportingInterfaceOrientationAllButUpsideDown() { }

}
