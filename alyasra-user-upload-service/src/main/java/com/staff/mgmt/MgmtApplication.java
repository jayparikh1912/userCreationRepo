package com.staff.mgmt;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class MgmtApplication {

	public static void main(String[] args) {
		SpringApplication.run(MgmtApplication.class, args);
		System.out.println("|-----------------------------------------------|");
		System.out.println("|                                               |");
		System.out.println("|         \uD83D\uDE00 \u001B[32m Application Started \u001B[0m \uD83D\uDE00           |");
		System.out.println("|                                               |");
		System.out.println("|-----------------------------------------------|");
	}

}
