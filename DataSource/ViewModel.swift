//
//  ViewModel.swift
//  DataSource
//
//  Created by Grigoriy Sapogov on 11/09/2019.
//  Copyright © 2019 Sima-Land. All rights reserved.
//

import RxSwift
import RxCocoa


class ViewModel {
    
    
    
    struct Input {
        let open: Driver<Void>
    }
    
    struct Output {
        let sections: Driver<[Section]>
    }
    
    func transform(input: Input) -> Output? {
        
        let section1 = Section(header: "section 1", items: [
                Row(name: "1", placeholder: "Name"),
                Row(name: "2", placeholder: "Second name"),
            ])
        
        let section2 = Section(header: "section 2", items: [
            
            ])
        
        let sections = Observable.of(section1, section2).toArray().asDriver(onErrorJustReturn: [])
        
        return Output(sections: sections)
        
//        return nil
        
    }
    
    
}
