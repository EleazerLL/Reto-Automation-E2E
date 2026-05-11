package com.curso.KarateCurso;

import com.intuit.karate.junit5.Karate;

class KarateOptionsRunner {
    
    @Karate.Test
    Karate testSpecificFeature() {
        // Aquí pasas la ruta del feature directamente
        return Karate.run("classpath:com/curso/KarateCurso/01user.feature");
    }
}