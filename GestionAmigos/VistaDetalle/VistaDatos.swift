//
//  VistaDatos.swift
//  GestionAmigos
//
//  Created by Aula11 on 23/9/21.
//

import SwiftUI

struct VistaDatos: View {
    @EnvironmentObject private var amigoVM: AmigoViewModel
    var index : Int
    @State var aboutMe:String
    @State var progreso:Int = 0
    
    var body: some View {
        VStack {
            HStack {
                Text(amigoVM.arrAmigos[index].nombre)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color.black)
                Button {
                    amigoVM.arrAmigos[index].favorito.toggle()
                } label: {
                    Image(systemName: amigoVM.arrAmigos[index].favorito ? "star.fill" : "star")
                        .foregroundColor(amigoVM.arrAmigos[index].favorito ? .yellow : .gray)
                        
                }
            }
        
        Label(amigoVM.arrAmigos[index].telefono, systemImage:"iphone")
                .font(.body)
        Link(destination: URL(string: amigoVM.arrAmigos[index].email)!, label: {
                Image(systemName: "livephoto")
                    .frame(width: 40, height: 40, alignment: .center)
                    .foregroundColor(Color.white)
                Text(amigoVM.arrAmigos[index].email)
        }).foregroundColor(.white)
        Divider()
        HStack {
            Text("Mi opinión: ")
                .font(.headline)
                .background(Color(red: 0.0, green: 188.0 / 255.0, blue: 1.0))
                .foregroundColor(Color.white)
            Text(amigoVM.arrAmigos[index].about)
                .foregroundColor(.white)
                .font(.headline)
                .background(Color(red: 0.0, green: 188.0 / 255.0, blue: 1.0))
                .overlay(Rectangle().stroke(Color.white, lineWidth:/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/))
            
        }.background(Color(red: 0.0, green: 188.0 / 255.0, blue: 1.0))
        Divider()
        if (aboutMe.count < 100) {
            
            ProgressView("Número de caracteres: \(aboutMe.count) / 150", value:Double(aboutMe.count),total: 150)
                .foregroundColor(Color.white)
                .frame(width: 350, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        } else if (aboutMe.count < 150) {
            ProgressView("Número de caracteres: \(aboutMe.count) / 150", value:Double(aboutMe.count), total: 150)
                .foregroundColor(Color.orange)
                .frame(width: 350, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        } else {
            ProgressView("Número de caracteres: \(aboutMe.count) / 150", value:Double(aboutMe.count), total: 150)
                .foregroundColor(Color.red)
                .frame(width: 350, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
        HStack {
            Text("Mi opinion...").foregroundColor(Color.white)
            Image(systemName: "pencil").foregroundColor(Color.white)
        }
        TextEditor(text: $aboutMe).onAppear(perform: {
            UITextView.appearance().backgroundColor = .clear
                aboutMe = amigoVM.arrAmigos[index].about
                    
            }).frame(width: 350, height: 200)
            .overlay(Rectangle().stroke(Color.white, lineWidth: 2))
            .disableAutocorrection(true)
            .foregroundColor(Color.white)
            .onChange(of: aboutMe, perform: { _ in
                if (aboutMe.count < 151) {
                    amigoVM.arrAmigos[index].about = aboutMe
                } else {
                    aboutMe = amigoVM.arrAmigos[index].about
                }
                amigoVM.arrAmigos[index].about = aboutMe
            }).ignoresSafeArea()
        }.background(Color(red: 0.0, green: 188.0 / 255.0, blue: 1.0))
    }
}

/*
struct VistaDatos_Previews: PreviewProvider {
    static var previews: some View {
        VistaDatos(amigoCurrent: AmigoViewModel().arrAmigos[index], aboutMe: AmigoViewModel().arrAmigos[index].about).environmentObject(AmigoViewModel())
    }
}
*/

