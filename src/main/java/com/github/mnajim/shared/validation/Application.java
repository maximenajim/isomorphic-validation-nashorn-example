package com.github.mnajim.shared.validation;

import jdk.nashorn.api.scripting.NashornScriptEngine;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.context.web.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;

import javax.script.ScriptEngineManager;
import javax.script.ScriptException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;

@SpringBootApplication
public class Application extends SpringBootServletInitializer {

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(Application.class);
    }

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }

    @Bean
    public NashornScriptEngine nashornScriptEngine(){
        NashornScriptEngine nashornScriptEngine = (NashornScriptEngine) new ScriptEngineManager().getEngineByName("nashorn");
        try {
            nashornScriptEngine.eval(read("static/passwordAnalyzer.js"));
        } catch (ScriptException e) {
            throw new RuntimeException(e);
        }
        return nashornScriptEngine;
    }

    private Reader read(String path) {
        InputStream in = getClass().getClassLoader().getResourceAsStream(path);
        return new InputStreamReader(in);
    }
}