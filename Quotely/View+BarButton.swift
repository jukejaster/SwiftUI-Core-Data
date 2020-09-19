//
//  View+BarButton.swift
//  Quotely
//
//  Created by Juke Jaster on 9/19/20.
//  Copyright © 2020 Juke Jaster. All rights reserved.
//

import SwiftUI

extension View {
    func barButton(_ type: BarButtonType, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            type.content
        }
    }
}

enum BarButtonType: String {
    case plus
    case done
    
    var content: AnyView {
        switch self {
        case .plus:
            return AnyView(
                Image(systemName: imageName ?? "")
            )
        case .done:
            return AnyView(
                Text(title ?? "")
                    .fontWeight(fontWeight)
                    .foregroundColor(.blue)
            )
        }
    }
    
    var title: String? {
        switch self {
        case .plus:
            return nil
        case .done:
            return rawValue.capitalized
        }
    }
    
    var imageName: String? {
        switch self {
        case .plus:
            return rawValue
        case .done:
            return nil
        }
    }
    
    var fontWeight: Font.Weight {
        switch self {
        case .done:
            return .medium
        default:
            return .regular
        }
    }
}


