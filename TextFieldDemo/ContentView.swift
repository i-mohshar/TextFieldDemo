//
//  PDFContentView.swift
//  TextFieldDemo
//
//  Created by Mohit Sharma on 21/9/2024.
//

import SwiftUI
import PDFKit

struct ContentView: View {
    var body: some View {
        
        NavigationView{
            List{
                NavigationLink(destination: SampleFormView()) {
                    Text("Sample Form")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .padding()

                // Second Navigation Link
                NavigationLink(destination: PDFViewerWithShare()) {
                    Text("Sample PDF Viewer")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(8)
                }
                .padding()
            }
            .navigationTitle("Samples")
        }
        
    }
}
