//
//  ColorViewModel.swift
//  Colors
//
//  Created by Nkanyiso Hlela on 2021/06/05.
//

import Foundation

class ColorViewModel: ObservableObject {
    @Published var state = State.idle
    private var colorApiService: ColorApiServiceProtocol
    
    init(colorApiService : ColorApiServiceProtocol) {
        self.colorApiService = colorApiService
    }
    func getHexValue(rgbColor: String){
        state = .fetching
        colorApiService.convertRGBColorToHex(rgbColor: rgbColor) { result in
            print("got results")
            switch result{
            case .success(let data):
                self.state = .fetched
            case .failure(let error):
                self.state = .error(error)
            }
        }
    }
}

extension ColorViewModel{
    enum State{
        case idle
        case fetching
        case fetched
        case error(Error)
        
    }
}
