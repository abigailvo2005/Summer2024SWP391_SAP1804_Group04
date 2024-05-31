package com.recs.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.LogoutConfigurer;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.servlet.util.matcher.MvcRequestMatcher;
import org.springframework.web.servlet.handler.HandlerMappingIntrospector;


@Configuration
@EnableWebSecurity
@EnableMethodSecurity
public class SecurityConfiguration {
    @Bean
    public UserDetailsService userDetailsService(){
//        UserDetails admin = User.withUsername("admin")
//                .password(passwordEncoder.encode("admin"))
//                .roles("ADMIN")
//                .build();
//        UserDetails manager = User.withUsername("manager")
//                .password(passwordEncoder.encode("manager"))
//                .roles("MANAGER")
//                .build();
//        UserDetails seller = User.withUsername("seller")
//                .password(passwordEncoder.encode("seller"))
//                .roles("SELLER")
//                .build();
        return new UserInfoDetailsService();
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http, MvcRequestMatcher.Builder mvc) throws Exception{
        return http.csrf().disable()
                .authorizeHttpRequests(authorize -> authorize
                        .requestMatchers(mvc.pattern("/login")).permitAll()
                        .requestMatchers(mvc.pattern("/admin/**")).hasRole("ADMIN")
                        .requestMatchers(mvc.pattern("/manager/**")).hasRole("MANAGER")
                        .requestMatchers(mvc.pattern("/seller/**")).hasRole("SELLER")
                        .requestMatchers(mvc.pattern("/**"), mvc.pattern("/api/**")).permitAll()
                        .anyRequest().authenticated())
                .formLogin(form -> form
                        .loginPage("/login").permitAll()
                        .successHandler(customAuthenticationSuccessHandler()))
                .logout(LogoutConfigurer::permitAll)
                .getOrBuild();
    }

    @Bean
    MvcRequestMatcher.Builder mvc(HandlerMappingIntrospector introspector) {
        return new MvcRequestMatcher.Builder(introspector);
    }

    @Bean
    public AuthenticationProvider authenticationProvider() {
        DaoAuthenticationProvider authenticationProvider = new DaoAuthenticationProvider();
        authenticationProvider.setUserDetailsService(userDetailsService());
        authenticationProvider.setPasswordEncoder(passwordEncoder());
        return authenticationProvider;
    }


    @Bean
    public AuthenticationSuccessHandler customAuthenticationSuccessHandler() {
        return (request, response, authentication) -> {
            String role = authentication.getAuthorities().iterator().next().getAuthority();
            if (role.equals("ROLE_ADMIN")) {
                response.sendRedirect("/admin");
            } else if (role.equals("ROLE_MANAGER")) {
                response.sendRedirect("/manager");
            } else if (role.equals("ROLE_STAFF")) {
                response.sendRedirect("/staff");
            } else if (role.equals("ROLE_AGENCY")) {
                response.sendRedirect("/agency");
            } else if (role.equals("ROLE_SELLER")) {
                response.sendRedirect("/seller");
            }
        };
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}
