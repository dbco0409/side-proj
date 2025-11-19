package com.pager.config;

import java.util.List;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

@Configuration
@EnableWebSecurity
public class SecurityConfig {
	
	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {

	    http
	        .cors(cors -> cors.configurationSource(corsConfigurationSource()))
	        .csrf(AbstractHttpConfigurer::disable)

	        .authorizeHttpRequests(auth -> auth
	            // 1) 관리자 페이지는 인증 필요
	            .requestMatchers("/admin/**").authenticated()

	            // 2) 그 외 페이지는 모두 허용
	            .anyRequest().permitAll()
	        );

	    return http.build();
	}


	@Bean
	public CorsConfigurationSource corsConfigurationSource() {
	    CorsConfiguration config = new CorsConfiguration();

	    config.setAllowedOrigins(List.of(
	            "http://localhost:5173",
	            "http://13.62.76.215:5173"
	    ));
	    config.setAllowedMethods(List.of("GET", "POST", "PUT", "DELETE", "OPTIONS"));
	    config.setAllowedHeaders(List.of("*"));
	    config.setExposedHeaders(List.of("*"));
	    config.setAllowCredentials(true);  // JSESSIONID 쿠키 허용

	    UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
	    source.registerCorsConfiguration("/**", config);

	    return source;
	}


    // ✅ 여기 추가!
    @Bean
    public UserDetailsService users() {
        UserDetails user = User.withUsername("testuser")
                .password("{noop}1234") // {noop} → 암호화 없이 사용
                .roles("USER")
                .build();
        return new InMemoryUserDetailsManager(user);
    }
}
