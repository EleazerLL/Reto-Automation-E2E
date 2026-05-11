package com.curso.KarateCurso;

import com.intuit.karate.junit5.Karate;


public class KarateRunner {
	@Karate.Test
	Karate testALL() {
	    return Karate.run("karateE2E.feature").relativeTo(getClass());
	}
	
}
