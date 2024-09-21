//
//  PDFViewWrapper.swift
//  TextFieldDemo
//
//  Created by Mohit Sharma on 21/9/2024.
//


import SwiftUI
import PDFKit

struct PDFViewWrapper: UIViewRepresentable {
    let pdfDocument: PDFDocument?

    func makeUIView(context: Context) -> PDFView {
        let pdfView = PDFView()
        pdfView.autoScales = true
        if let document = pdfDocument {
            pdfView.document = document
        }
        return pdfView
    }

    func updateUIView(_ uiView: PDFView, context: Context) {
        // No update needed for now
    }
}

struct PDFViewerWithShare: View {
    let pdfDocument = PDFDocument(url: Bundle.main.url(forResource: "samplefile", withExtension: "pdf")!)
    
    var body: some View {
        VStack {
            PDFViewWrapper(pdfDocument: pdfDocument)
                .edgesIgnoringSafeArea(.all)
            
            Button(action: {
                sharePDF()
            }) {
                Text("Share PDF")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            .padding()
        }
    }
    
    private func sharePDF() {
        guard let pdfDocument = pdfDocument,
              let data = pdfDocument.dataRepresentation() else {
            return
        }

        let activityController = UIActivityViewController(activityItems: [data], applicationActivities: nil)

        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let rootViewController = windowScene.windows.first?.rootViewController {
            rootViewController.present(activityController, animated: true, completion: nil)
        }
    }
}
