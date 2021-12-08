package Dominio;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.*;

import Conexion.Conexion;
import Entidades.Alumno;
import Entidades.Nacionalidad;
import Entidades.Provincia;

public class AlumnosDao {

	public ArrayList<Alumno> obtenerAlumnos(){
		
		ArrayList<Alumno> Lista = new ArrayList<Alumno>();
		
		PreparedStatement st;
		ResultSet rs;
		Connection conexion = Conexion.getConexion().getSQLConexion();
		Nacionalidad nac = new Nacionalidad();
		Provincia prov = new Provincia();
		
		String ListaAlumnos = "SELECT * FROM `vw-alumnos`;";
		
		try 
		{
			st = conexion.prepareStatement(ListaAlumnos);
			rs = st.executeQuery();
			while(rs.next())
			{
				Alumno alumno = new Alumno();
				alumno.setLegajo(rs.getInt("LegajoAlumno"));
				alumno.setDNI(rs.getInt("DniAlumno"));
				alumno.setNombre(rs.getString("NombreAlumno"));
				alumno.setApellido(rs.getString("ApellidoAlumno"));
				SimpleDateFormat format = new SimpleDateFormat("dd-LL-yyyy");
				alumno.setFechaNac(format.format(rs.getDate("FechaNacAlumno")));
				alumno.setDireccion(rs.getString("DireccionAlumno"));
				prov.setDescripcion(rs.getString("ProvinciaAlumno"));
				alumno.setProvincia(prov);
				nac.setDescripcion(rs.getString("NacionalidadAlumno"));
				alumno.setNacionalidad(nac);
				alumno.setEmail(rs.getString("EmailAlumno"));
				alumno.setTelefono(rs.getInt("TelefonoAlumno"));
				
				Lista.add(alumno);
				
			}
			
			//conexion.close();
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return Lista;
	}
	
	public ArrayList<Alumno> filtrarAlumnos(String text) {
		
		ArrayList<Alumno> Lista = new ArrayList<Alumno>();

		PreparedStatement st;
		ResultSet rs;
		Connection conexion = Conexion.getConexion().getSQLConexion();
		Nacionalidad nac = new Nacionalidad();
		Provincia prov = new Provincia();

		String ListaFiltrada = "SELECT * FROM alumnos where concat_ws(LegajoAlumno, DniAlumno, NombreAlumno, ApellidoAlumno, FechaNacAlumno," 
				+ "DireccionAlumno, ProvinciaAlumno, NacionalidadAlumno, EmailAlumno, TelefonoAlumno) like '%"+text+"%'";
		
		try {
			st = conexion.prepareStatement(ListaFiltrada);
			rs = st.executeQuery();
			while (rs.next()) {
				Alumno alumno = new Alumno();
				alumno.setLegajo(rs.getInt("LegajoAlumno"));
				alumno.setDNI(rs.getInt("DniAlumno"));
				alumno.setNombre(rs.getString("NombreAlumno"));
				alumno.setApellido(rs.getString("ApellidoAlumno"));
				SimpleDateFormat format = new SimpleDateFormat("dd-LL-yyyy");
				alumno.setFechaNac(format.format(rs.getDate("FechaNacAlumno")));
				alumno.setDireccion(rs.getString("DireccionAlumno"));
				prov.setDescripcion(rs.getString("ProvinciaAlumno"));
				alumno.setProvincia(prov);
				nac.setDescripcion(rs.getString("NacionalidadAlumno"));
				alumno.setNacionalidad(nac);
				alumno.setEmail(rs.getString("EmailAlumno"));
				alumno.setTelefono(rs.getInt("TelefonoAlumno"));

				Lista.add(alumno);

			}

			//conexion.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return Lista;

	}
	
}
