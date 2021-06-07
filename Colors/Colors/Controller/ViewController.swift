//
//  ViewController.swift
//  Colors
//
//  Created by Nkanyiso Hlela on 2021/06/05.
//

import UIKit
import Combine

class ViewController: UIViewController {
    var viewModel = ColorViewModel(colorApiService: ColorApiService())
    var cancellable: AnyCancellable?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidLoad()
        self.updateHexValue(hexString: "")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cancellable = viewModel.$state.receive(on: DispatchQueue.main).sink(receiveValue: { state in
            switch state{
            case .idle:
                print("Initialized viewmodel")
            case .fetching:
                self.view.activityStartAnimating(activityColor: UIColor.white, backgroundColor: UIColor.black.withAlphaComponent(0.5))
            case .fetched(let hexValue):
                self.updateHexValue(hexString: hexValue.value)
                self.view.activityStopAnimating()
            case .error(let error):
                self.view.activityStopAnimating()
                self.showBasicAlert(alertTitle: NSLocalizedString("Colors", comment: ""), alertMessage: error.localizedDescription)
            }
        })
        
    }
    
    deinit {
        self.cancellable?.cancel()
    }
    
    func updateHexValue(hexString: String){
        hexValueLabel.text = " \(NSLocalizedString("The hex value : ", comment: "")) \(hexString)"
    }
    
    @IBAction func pickColor(_ sender: Any) {
        let picker = UIColorPickerViewController()
        picker.delegate = self
        self.present(picker, animated: true, completion: nil)
    }
    
    @IBOutlet weak var hexValueLabel: UILabel!
}
extension ViewController: UIColorPickerViewControllerDelegate {
    
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        let selectedColor = viewController.selectedColor
        viewModel.getHexValue(rgbColor: selectedColor.rgbString() ?? "")
    }
    
}
