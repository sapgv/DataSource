//
//  Row.swift
//  DataSource
//
//  Created by Grigoriy Sapogov on 11/09/2019.
//  Copyright © 2019 Sima-Land. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class Row {
    
    var id: String = String.uuid
    var placeholder: String = ""
    var name: String = ""
    var value: BehaviorRelay<String> = BehaviorRelay<String>(value: "")
    
    init(name: String, placeholder: String) {
        self.name = name
        self.placeholder = placeholder
    }
    
}

extension Row: IdentifiableType {
    
    typealias Identity = String
    var identity: Identity {
        return id
    }
}

extension Row: Equatable {
    
    static func == (lhs: Row, rhs: Row) -> Bool {
        return lhs.id == rhs.id
    }

}

struct Section {
    var header: String
    var items: [Row]
}

extension Section: AnimatableSectionModelType {
    
    typealias Identity = String
    typealias Item = Row
    
    var identity: Identity {
        return header
    }
    
    init(original: Section, items: [Row]) {
        self = original
        self.items = items
    }
    
}

