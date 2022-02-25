//
//  ContentView.swift
//  AnimalClasifier
//
//  Created by shehan karunarathna on 2022-02-25.
//

import SwiftUI
import CoreML

struct ContentView: View {
    func testModel() -> AnimalClassifierOutput?{
        do {
            let config = MLModelConfiguration()
            let model = try AnimalClassifier(configuration: config)
            let prediction  =  try model.prediction(hair: 1, feathers: 0, eggs: 0, milk: 1, airborne: 0, aquatic: 1, predator: 1, toothed: 1, backbone: 1, breathes: 1, venomous: 0, fins: 1, legs: 0, tail: 1, domestic: 0, catsize: 0)
            return prediction
        }catch {
            
        }
        return nil
    }
    
    var body: some View {
        let prediction =  testModel()!.class_type
        let preditionAccuracy = testModel()!.class_typeProbability[prediction] ?? 0
        VStack{
            Text("Animal Prediction")
                .padding()
            Text(String(prediction))
            Text(String(String(preditionAccuracy)))
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
