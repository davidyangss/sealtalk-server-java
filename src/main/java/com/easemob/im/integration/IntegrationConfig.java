package com.easemob.im.integration;

import com.easemob.im.hx.AccessSecret;
import com.easemob.im.hx.Appkey;
import com.easemob.im.hx.GrantType;
import com.easemob.im.relay.EasemobApi;
import com.easemob.im.relay.EasemobApiProvider;
import com.easemob.im.relay.api.http.ApiHttp;
import com.easemob.im.relay.api.http.HttpClientCustomizers;
import com.easemob.im.relay.api.http.WebClientCustomizers;
import lombok.Data;
import org.springframework.beans.factory.ObjectProvider;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.web.reactive.function.client.ReactorNettyHttpClientMapper;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.web.reactive.function.client.WebClientCustomizer;
import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.client.reactive.ReactorResourceFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.reactive.function.client.WebClient;

import java.time.Duration;

@Configuration
@ConfigurationProperties("easemob.config")
@Data
@Component
@EnableCaching
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
    public EasemobApi easemobApi(ObjectProvider<ReactorNettyHttpClientMapper> mapperProvider,
                                 ObjectProvider<WebClientCustomizer> webClientCustomizerProvider,
                                 ObjectProvider<ReactorResourceFactory> resourceFactoryProvider){
        HttpClientCustomizers httpClientCustomizers = new HttpClientCustomizers(mapperProvider);
        WebClientCustomizers webClientCustomizers = new WebClientCustomizers(webClientCustomizerProvider, resourceFactoryProvider, httpClientCustomizers);

        return EasemobApiProvider.builder()
                .appkey(appkey)
                .accessSecretSupplier(this::appSecret)
                .webClientBuilderSupplier(() -> webClientCustomizers.customWebClientBuilder(
                        httpClientCustomizers.compress()
                                .andThen(httpClientCustomizers.readTimout(readTimout))
                                .andThen(httpClientCustomizers.connectTimout(connectTimout))
                                .andThen(httpClientCustomizers.followRedirect(true)),
                        webClientCustomizers.springWebClientCustomizerConfigure()).apply(WebClient.builder()))
                .restBase((count) -> restBase)
                .serverApiOkConsumer(serverApiOk -> {})
                .cacheManager(cacheManager)
                .webClientCustomizers(webClientCustomizers)
                .build();
    }
}
