//
//  Coordinator.swift
//  OcculutionPractice
//
//  Created by Fatih Emre Sarman on 10.07.2024.
//

import RealityKit
import Combine
import SwiftUI
import ARKit

class Coordinator {
    
    var arView: ARView?
    var cancellable: AnyCancellable?
    
    func setup() {
        
        guard let arView = arView else {
            return
        }
        
        let anchor = AnchorEntity(plane: .horizontal )
        
        let box = ModelEntity(mesh: MeshResource.generateBox(size: 0.3), materials: [OcclusionMaterial()])
        box.generateCollisionShapes(recursive: true)
        arView.installGestures(.all , for: box)
        
        cancellable = ModelEntity.loadAsync(named: "robot_walk_idle").sink { [weak self] completion in
            if case let .failure(error) = completion {
                fatalError("Unable to load model \(error)")
            }
            self?.cancellable?.cancel()
        } receiveValue: { entity in
            anchor.addChild(entity)
        }
        
        anchor.addChild(box)
        arView.scene.addAnchor(anchor)
    }
}
