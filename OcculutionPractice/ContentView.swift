//
//  ContentView.swift
//  OcculutionPractice
//
//  Created by Fatih Emre Sarman on 10.07.2024.
//

import SwiftUI
import RealityKit
import Combine

struct ContentView : View {
    var body: some View {
        ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)

        context.coordinator.arView = arView
        context.coordinator.setup()

        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
}

//#Preview {
//    ContentView()
//}
