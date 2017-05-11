//
//  InformacaoPessoalViewController.swift
//  CompraLeve
//
//  Created by Student on 5/9/17.
//  Copyright © 2017 Wolves. All rights reserved.
//

import UIKit
import MapKit

class InformacaoPessoalViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var nomeTextField: UITextField!
    
    @IBOutlet weak var celularTextField: UITextField!
    
    @IBOutlet weak var ruaTextField: UITextField!
    
    @IBOutlet weak var bairroTextField: UITextField!
    
    @IBOutlet weak var numeroTextField: UITextField!
    
    @IBOutlet weak var rgTextField: UITextField!
    
    @IBOutlet weak var cpfTextField: UITextField!
    
    @IBOutlet weak var complementoTextField: UITextField!
    
    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager = CLLocationManager()
    var userLocation = CLLocation()
    let regionRadius: CLLocationDistance = 1000
    
    
    var numeroInt16: Int16 {
        if let text = numeroTextField.text {
            if let intValue = Int16(text) {
                return intValue
            }
        }
        return 0
    }
    
    var bairroInt16: Int16 {
        if let text = bairroTextField.text {
            if let intValue = Int16(text) {
                return intValue
            }
        }
        return 0
    }
    
    @IBAction func addButton() {
        let nome = nomeTextField.text
        let celular = celularTextField.text
        let rua = ruaTextField.text
        let bairro = bairroInt16
        let numero = numeroInt16
        let rg = rgTextField.text
        let cpf = cpfTextField.text
        let complemento = complementoTextField.text
        
        let informacaoPessoal = InformacoesPessoais()
        informacaoPessoal.nome = nome
        informacaoPessoal.celular = celular
        informacaoPessoal.rua = rua
        informacaoPessoal.bairro = bairro
        informacaoPessoal.numero = numero
        informacaoPessoal.rg = rg
        informacaoPessoal.cpf = cpf
        informacaoPessoal.complemento = complemento
        
        if InformacoesPessoaisDAO.insert(informacaoPessoal: informacaoPessoal) {
            print("Informações salvas com sucesso")
            self.navigationController?.popViewController(animated: true)
        } else {
            print("Deu merda")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.showsUserLocation = true
        setupLocationManager()
    }
    
    func setupLocationManager(){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if locations.count > 0 {
            if let location = locations.last {
                userLocation = location
                
                centerMapOnLocation(location: userLocation)
                print("A localizacao atual eh: \(userLocation.coordinate)")
            }
        }
    }
    // Sobreescrevemos o metodo touchesBegan(_: with:) que é chamado quando tocamos na tela. Isso faz com que você possa para a edição
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Chamamos a view para forçar que a edição pare
        self.view.endEditing(true)
    }
}
