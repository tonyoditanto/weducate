//
//  Planning.swift
//  Weducate
//
//  Created by Arifin Firdaus on 19/03/20.
//  Copyright © 2020 Weducate. All rights reserved.
//

import Foundation

enum PlanningStatus: String {
    case todo
    case doing
    case done
}

struct Planning {
    var id: Int
    var title: String
    var detail: String
    var status: PlanningStatus
}
