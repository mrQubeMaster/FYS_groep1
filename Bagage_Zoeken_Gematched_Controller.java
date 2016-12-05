/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import Data.BagageData;
import Data.DbConnection;
import Data.VliegveldData;
import Main.Screen_Switcher;
import java.io.IOException;
import java.net.URL;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.event.Event;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;

/**
 *
 * @author gebruiker
 */
public class Bagage_Zoeken_Gematched_Controller implements Initializable {

    @FXML
    private TableView<BagageData> tableUser;
    @FXML
    private TableColumn<BagageData, String> kolomId;
    @FXML
    private TableColumn<BagageData, String> kolomRegistratieNummer;
    @FXML
    private TableColumn<BagageData, String> kolomDatumGevonden;
    @FXML
    private TableColumn<BagageData, String> kolomDatumAangemeld;
    @FXML
    private TableColumn<BagageData, String> kolomVliegveldHerkomst;
    @FXML
    private TableColumn<BagageData, String> kolomVliegveldBestemming;
    @FXML
    private TableColumn<BagageData, String> kolomVliegveldGevonden;
    @FXML
    private TableColumn<BagageData, String> kolomVluchtnummer;
    @FXML
    private TableColumn<BagageData, String> kolomVluchtdatum;
    @FXML
    private TableColumn<BagageData, String> kolomGewicht;
    @FXML
    private TableColumn<BagageData, String> kolomKleur;
    @FXML
    private TableColumn<BagageData, String> kolomMerk;
    @FXML
    private TableColumn<BagageData, String> kolomSpecialeOpmerkingen;
    @FXML
    private TableColumn<BagageData, String> kolomPersoonsnummer;
    @FXML
    private TableColumn<BagageData, String> kolomUserId;
    @FXML

    private Button btnLoad;
    private ObservableList<BagageData> data;
    private DbConnection dc;

    @FXML
    private void loadDataFromDatabase(ActionEvent event) {
        try {
            Connection conn = dc.Connect();
            data = FXCollections.observableArrayList();
            ResultSet rs = conn.createStatement().executeQuery("SELECT * FROM gevondenbagage");
            while (rs.next()) {
                data.add(new BagageData(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getString(12), rs.getString(13), rs.getString(14), rs.getString(15)));

            }

        } catch (SQLException ex) {
            System.err.println("Error" + ex);
        }

            
        
        kolomId.setCellValueFactory(new PropertyValueFactory<>("id"));
        kolomRegistratieNummer.setCellValueFactory(new PropertyValueFactory<>("registratieNummer"));
        kolomDatumGevonden.setCellValueFactory(new PropertyValueFactory<>("datumGevonden"));
        kolomDatumAangemeld.setCellValueFactory(new PropertyValueFactory<>("datumAangemeld"));
        kolomVliegveldHerkomst.setCellValueFactory(new PropertyValueFactory<>("vliegveldHerkomst"));
        kolomVliegveldBestemming.setCellValueFactory(new PropertyValueFactory<>("vliegveldBestemming"));
        kolomVliegveldGevonden.setCellValueFactory(new PropertyValueFactory<>("vliegveldGevonden"));
        kolomVluchtnummer.setCellValueFactory(new PropertyValueFactory<>("vluchtNummer"));
        kolomVluchtdatum.setCellValueFactory(new PropertyValueFactory<>("vluchDatum"));
        kolomGewicht.setCellValueFactory(new PropertyValueFactory<>("gewicht"));
        kolomKleur.setCellValueFactory(new PropertyValueFactory<>("kleur"));
        kolomMerk.setCellValueFactory(new PropertyValueFactory<>("merk"));
        kolomSpecialeOpmerkingen.setCellValueFactory(new PropertyValueFactory<>("specialeOpmerkingen"));
        kolomPersoonsnummer.setCellValueFactory(new PropertyValueFactory<>("persoonsnummer"));
        kolomUserId.setCellValueFactory(new PropertyValueFactory<>("userId"));
        
        tableUser.setItems(null);
        tableUser.setItems(data);

    }
    
    @FXML
    private void backBtn(ActionEvent event) throws IOException {
        Screen_Switcher schakel = new Screen_Switcher();
        schakel.Switch("/FXML/Home_Page.fxml");
    }

    @FXML
    private void menuBagageRegistreren(ActionEvent event) throws IOException {
        Screen_Switcher schakel = new Screen_Switcher();
        schakel.Switch("/FXML/Bagage_Registreren_Page.fxml");
    }

    @FXML
    private void uitlogBtn(ActionEvent event) throws IOException {
        Screen_Switcher schakel = new Screen_Switcher();
        schakel.Switch("/FXML/Inlog_Page.fxml");

    }

    @FXML
    private void wwWijzigenBtn(ActionEvent event) throws IOException {
        Screen_Switcher schakel = new Screen_Switcher();
        schakel.Switch("/FXML/Wachtwoord_Reset_Profiel_Page.fxml");
    }

    @FXML
    private void profielBtn(ActionEvent event) throws IOException {
        Screen_Switcher schakel = new Screen_Switcher();
        schakel.Switch("/FXML/Profiel_Page.fxml");
    }

    @FXML
    private void menuBagageRegistreren(Event event) {
    }

    @FXML
    private void profielBtn(Event event) {
    }

    @FXML
    private void wwWijzigenBtn(Event event) {
    }

    @FXML
    private void uitlogBtn(Event event) {
    }
    

    @Override
    public void initialize(URL location, ResourceBundle resources) {
        dc = new DbConnection();
    }

}
