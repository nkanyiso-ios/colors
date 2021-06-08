//
//  ViewController.swift
//  Colors
//
//  Created by Nkanyiso Hlela on 2021/06/05.
//

import UIKit
import Combine

class ViewController: UIViewController {
    private lazy var viewModel = ColorViewModel(colorApiService: ColorApiService())
    private var cancellable: AnyCancellable?
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorPreview.layer.cornerRadius = 10
        self.cancellable = viewModel.$state.receive(on: DispatchQueue.main).sink(receiveValue: { [weak self] state in
            switch state{
            case .idle:
                print("Initialized viewmodel")
            case .fetching:
                self?.view.activityStartAnimating(activityColor: UIColor.white, backgroundColor: UIColor.black.withAlphaComponent(0.5))
            case .fetched(let hexValue):
                self?.updateHexValue(hexString: hexValue.value)
                
                self?.colorPreview.transform = CGAffineTransform.init(scaleX: 0.5, y: 0.5)
                UIView.animate(withDuration: 0.4,
                               delay: 0.0,
                               options: .curveEaseInOut) { [weak self] in
                    self?.colorPreview.alpha = 1
                    self?.colorPreview.transform = .identity
                } completion: { _ in }
                
                UIView.animate(withDuration: 0.6) { [weak self] in
                    self?.colorPreview.alpha = 1
                    self?.colorPreview.transform = .identity
                }
                self?.view.activityStopAnimating()
            case .error(let error):
                self?.view.activityStopAnimating()
                self?.showBasicAlert(alertTitle: NSLocalizedString("Colors", comment: ""), alertMessage: error.localizedDescription)
            }
        })
    }
    
    deinit { self.cancellable?.cancel() }
    
    private func updateHexValue(hexString: String) {
        hexValueLabel.text = " \(NSLocalizedString("The hex value : ", comment: "")) \(hexString)"
    }
    
    @IBAction private func pickColor(_ sender: Any) {
        let picker = UIColorPickerViewController()
        picker.delegate = self
        self.present(picker, animated: true, completion: nil)
    }
    
    @IBOutlet private weak var hexValueLabel: UILabel!
    @IBOutlet private weak var colorPreview: UIView!
}
extension ViewController: UIColorPickerViewControllerDelegate {
    
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        let selectedColor = viewController.selectedColor
        colorPreview.backgroundColor = selectedColor
        colorPreview.alpha = 0
        
        viewModel.getHexValue(rgbColor: selectedColor.rgbString() ?? "")
    }
    
}
