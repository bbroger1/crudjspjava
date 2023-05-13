package com.crudjspjava.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.crudjspjava.bean.Usuario;

public class UsuarioDao {
	
	public static Connection getConnection() {
		Connection con = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/crudjspjava", "root", "root");
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return con;
	}
	
	public static List<Usuario> getAllUsuarios(){
		
		List<Usuario> list = new ArrayList<Usuario>();
		
		try {
			Connection con = getConnection();
			String sql = "SELECT * FROM usuario";
			PreparedStatement ps = con.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				Usuario usuario = new Usuario();
				usuario.setId(rs.getInt("id"));
				usuario.setNome(rs.getString("nome"));
				usuario.setEmail(rs.getString("email"));
				usuario.setPassword(rs.getString("password"));
				usuario.setSexo(rs.getString("sexo"));
				usuario.setPais(rs.getString("pais"));
				
				list.add(usuario);
			};
			
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return list;
	}
	
	public static Usuario getUsario(int id) {
		
		Usuario usuario = null;
		
		try {
			Connection con = getConnection();
			String sql = "SELECT * FROM usuario WHERE id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				usuario = new Usuario();
				usuario.setId(rs.getInt("id"));
				usuario.setNome(rs.getString("nome"));
				usuario.setEmail(rs.getString("email"));
				usuario.setPassword(rs.getString("password"));
				usuario.setSexo(rs.getString("sexo"));
				usuario.setPais(rs.getString("pais"));
			};
			
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return usuario;
	}
	
	public static int updateUsuario(Usuario u) {
		int status = 0;
		String sql;
		
		try {
			Connection con = getConnection();
			
			if(u.getPassword() == null) {
				sql = "UPDATE usuario SET nome = ?, email = ?, sexo = ?, pais=? WHERE id = ?";
				
				PreparedStatement ps = con.prepareStatement(sql);
				
				ps.setString(1, u.getNome());
				ps.setString(2, u.getEmail());
				ps.setString(3, u.getSexo());
				ps.setString(4, u.getPais());
				ps.setInt(5,  u.getId());
				
				status = ps.executeUpdate();
			} else {
				sql = "UPDATE usuario SET nome = ?, password = ?, email = ?, sexo = ?, pais=? WHERE id = ?";
				
				PreparedStatement ps = con.prepareStatement(sql);
				
				ps.setString(1, u.getNome());
				ps.setString(2, u.getPassword());
				ps.setString(3, u.getEmail());
				ps.setString(4, u.getSexo());
				ps.setString(5, u.getPais());
				ps.setInt(6,  u.getId());
				
				status = ps.executeUpdate();
			}
			
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return status;
	}
	
	public static int criarUsuario(Usuario u) {
		int status = 0;
		
		try {
			Connection con = getConnection();
			String sql = "INSERT INTO usuario (nome, password, email, sexo, pais) values(?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setString(1, u.getNome());
			ps.setString(2, u.getPassword());
			ps.setString(3, u.getEmail());
			ps.setString(4, u.getSexo());
			ps.setString(5, u.getPais());
			
			status = ps.executeUpdate();
			
			con.close();
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return status;
	}
	
	public static int excluirUsuario(Usuario u) {
		int status = 0;
		
		try {
			Connection con = getConnection();
			String sql = "DELETE FROM usuario WHERE id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setInt(1,  u.getId());
			
			status = ps.executeUpdate();
			
			con.close();
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return status;
	}
	
	public static List<Usuario> getRecords(int start, int total){
		List<Usuario> list = new ArrayList<Usuario>();
		
		try {
			Connection con = getConnection();
			String sql = "SELECT * FROM usuario LIMIT " + start + ", " + total;
			PreparedStatement ps = con.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				Usuario usuario = new Usuario();
				usuario.setId(rs.getInt("id"));
				usuario.setNome(rs.getString("nome"));
				usuario.setEmail(rs.getString("email"));
				usuario.setPassword(rs.getString("password"));
				usuario.setSexo(rs.getString("sexo"));
				usuario.setPais(rs.getString("pais"));
				
				list.add(usuario);
			};
			
			con.close();
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return list;
		
	}
	
	public static int getTotalRecords() {
		int totalRecords = 0;
		
		try {
			Connection con = getConnection();
			String sql = "SELECT count(id) as total FROM usuario";
			PreparedStatement ps = con.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			
			rs.next();
			
			totalRecords = Integer.parseInt(rs.getString("total"));
			
			con.close();
			
		} catch (Exception e) {
			System.out.println(e);
		}
				
		return totalRecords;
	}
}
