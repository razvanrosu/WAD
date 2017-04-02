package com.online.shop.config;

import java.util.Properties;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.JpaVendorAdapter;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

@Configuration
@EnableTransactionManagement
@EnableJpaRepositories(basePackages = { "com.online.shop.repository" })
public class PersistenceConfig {

	@Value("${dataSource.className}")
	private String dataSourceClass;
	@Value("${dataSource.port}")
	private String dbPort;
	@Value("${dataSource.url}")
	private String dbUrl;
	@Value("${dataSource.dbName}")
	private String dbName;
	@Value("${dataSource.username}")
	private String dbUsername;
	@Value("${dataSource.password}")
	private String dbPassword;

	@Value("${hibernate.dialect}")
	private String hibernateDialect;
	@Value("${hibernate.hbm2ddl.auto}")
	private String hibernateHbm2ddl;
	@Value("${hibernate.show_sql}")
	private Boolean hibernateShowSql;
	@Value("${hibernate.format_sql}")
	private Boolean hibernateFormatSql;
	@Value("${hibernate.enable_lazy_load_no_trans}")
	private Boolean hibernateLazyLoadNoTrans;

	@Bean(name = "dataSource")
	public DataSource getDataSource() {
		HikariConfig config = new HikariConfig();
		config.setDataSourceClassName(dataSourceClass);
		config.setUsername(dbUsername);
		config.setPassword(dbPassword);
		config.addDataSourceProperty("databaseName", dbName);
		config.addDataSourceProperty("port", dbPort);
		config.addDataSourceProperty("url", dbUrl);

		return new HikariDataSource(config);
	}

	@Bean(name = "entityManagerFactory")
	public LocalContainerEntityManagerFactoryBean getEntityManagerFactory(DataSource dataSource) {
		JpaVendorAdapter vendorAdapter = new HibernateJpaVendorAdapter();

		LocalContainerEntityManagerFactoryBean emf = new LocalContainerEntityManagerFactoryBean();
		emf.setDataSource(dataSource);
		emf.setPackagesToScan("com.online.shop.domain");

		Properties properties = new Properties();
		properties.put("hibernate.dialect", hibernateDialect);
		properties.put("hibernate.hbm2ddl.auto", hibernateHbm2ddl);
		properties.put("hibernate.show_sql", hibernateShowSql);
		properties.put("hibernate.format_sql", hibernateFormatSql);
		properties.put("hibernate.enable_lazy_load_no_trans", hibernateLazyLoadNoTrans);

		emf.setJpaProperties(properties);
		emf.setJpaVendorAdapter(vendorAdapter);

		return emf;
	}

	@Bean(name = "transactionManager")
	public JpaTransactionManager getJpaTransactionManager(LocalContainerEntityManagerFactoryBean emf) {
		JpaTransactionManager jpaTransactionManager = new JpaTransactionManager();
		jpaTransactionManager.setEntityManagerFactory(emf.getObject());
		return jpaTransactionManager;
	}
}
