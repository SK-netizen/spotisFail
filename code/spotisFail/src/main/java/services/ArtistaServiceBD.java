package services;


import util.ConexionUtil;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ArtistaServiceBD implements ArtistaService{
    @Override
    public boolean addArtista() {
        return false;
    }

    @Override
    public String getNombreArtistaById(String idArtista) {
        String nombreArtista = "";
        ResultSet resultados = null;
        try {
            Statement sentencia = ConexionUtil.openStatement();
            synchronized (sentencia) {
                resultados = sentencia
                        .executeQuery("SELECT Nombre FROM Artista where idArtista='" + idArtista+ "'");
            }
            if (resultados.next() == false) {
                return null;
            } else {
                nombreArtista=resultados.getString(1);
                return nombreArtista;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Se cierra resultSet
            if (resultados != null) {
                try {
                    resultados.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
        }
        return nombreArtista;
    }
}
