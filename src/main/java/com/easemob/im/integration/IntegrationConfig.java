package com.easemob.im.integration;

import com.easemob.im.hx.AccessSecret;
import com.easemob.im.hx.Appkey;
import com.easemob.im.hx.GrantType;
import com.easemob.im.relay.EasemobApi;
import com.easemob.im.relay.EasemobApiProvider;
import com.easemob.im.relay.api.http.ApiHttp;
import com.easemob.im.relay.api.http.HttpClientCustomizers;
import com.easemob.im.relay.api.http.WebClientConfig;
import com.easemob.im.relay.api.http.WebClientCustomizers;
import lombok.Data;
import org.springframework.beans.factory.ObjectProvider;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.boot.autoconfigure.web.reactive.function.client.ReactorNettyHttpClientMapper;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.web.reactive.function.client.WebClientCustomizer;
import org.springframework.cache.Cache;
import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.http.client.reactive.ReactorResourceFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.reactive.function.client.WebClient;

import java.time.Duration;

@Configuration
@ConfigurationProperties("easemob.config")
@Data
@Component
@EnableCaching
@Import(WebClientConfig.class)
public class IntegrationConfig {
    Appkey appkey;
    Duration connectTimout = Duration.ofSeconds(30);
    Duration readTimout = Duration.ofSeconds(30);

    String clientId;
    String clientSecret;

    ApiHttp restBase;

    @Autowired
    CacheManager cacheManager;


    @Bean
    public AccessSecret appSecret(){
        return AccessSecret.builder()
                .grantType(GrantType.CLIENT_CREDENTIALS)
                .clientId(clientId)
                .clientSecret(clientSecret)
                .build();
    }

    @Bean
    public EasemobApi easemobApi(WebClient.Builder webClientBuilder, WebClientCustomizers webClientCustomizers){
        EasemobApiProvider provider = new EasemobApiProvider(appkey, this::appSecret, () -> webClientBuilder, (count) -> restBase, serverApiOk -> {});
        provider.setCacheManager(cacheManager);
        provider.setWebClientCustomizers(webClientCustomizers);

        return provider;
    }
}
