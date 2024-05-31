package com.recs;

import com.recs.config.WebConfiguration;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.boot.autoconfigure.orm.jpa.HibernateJpaAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Import;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication()
@ComponentScan({ "com.recs" })
@EnableJpaRepositories(basePackages = "com.recs.repositories")
@EntityScan(basePackages = "com.recs.models.entities")
public class RecsApplication {

	public static void main(String[] args) {
		SpringApplication.run(RecsApplication.class, args);
	}

}
