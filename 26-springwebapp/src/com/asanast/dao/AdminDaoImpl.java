package com.asanast.dao;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSourceUtils;
import org.springframework.stereotype.Component;

import com.asanast.pojo.Admin;
import com.asanast.pojo.AdminRowMapper;

@Component
public class AdminDaoImpl implements AdminDao {

	private NamedParameterJdbcTemplate jdbcTemplate;

	@Autowired
	private void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
	}

	@Override
	public boolean save(Admin admin) {
		BeanPropertySqlParameterSource paramMap = new BeanPropertySqlParameterSource(admin);
		return jdbcTemplate.update(
				"INSERT INTO admin (nombre,cargo, fechaCreacion) VALUES (:nombre, :cargo, :fechaCreacion)",
				paramMap) == 1;
	}

	@Override
	public List<Admin> findAll() {
		return jdbcTemplate.query("SELECT * from admin", new AdminRowMapper());
	}

	@Override
	public Admin findById(int id) {
		return jdbcTemplate.queryForObject("SELECT * FROM admin WHERE idAd=:idAd",
				new MapSqlParameterSource("idAd", id), new AdminRowMapper());
	}

	@Override
	public List<Admin> findByNombre(String nombre) {
		return jdbcTemplate.query("SELECT * FROM admin WHERE nombre like :nombre",
				new MapSqlParameterSource("nombre", "%" + nombre + "%"), new AdminRowMapper());
	}

	@Override
	public boolean update(Admin admin) {
		return jdbcTemplate.update("UPDATE admin SET nombre = :nombre, cargo = :cargo, fechaCreacion = :fechaCreacion WHERE idAd = :idAd",
				new BeanPropertySqlParameterSource(admin)) == 1;
	}

	@Override
	public boolean delete(int idAd) {
		return jdbcTemplate.update("DELETE FROM admin WHERE idAd = :idAd",
				new MapSqlParameterSource("idAd", idAd)) == 1;
	}

	@Override
	public int[] saveAll(List<Admin> admins) {
		SqlParameterSource[] batchArgs = SqlParameterSourceUtils.createBatch(admins.toArray());

		return jdbcTemplate.batchUpdate(
				"insert into Admin (idAd, nombre, cargo, fechaCreacion) values (:idAd, :nombre, :cargo, :fechaCreacion)",
				batchArgs);
	}

}
