package com.easemob.im.integration;

import com.easemob.im.hx.AccessSecret;
import com.easemob.im.hx.Appkey;
import com.easemob.im.hx.GrantType;
import com.easemob.im.relay.EasemobApi;
import com.easemob.im.relay.EasemobApiProvider;
import com.easemob.im.relay.api.http.ApiHttp;
import com.easemob.im.relay.api.http.HttpClientCustomizers;
import lombok.Data;
import org.springframework.beans.factory.ObjectProvider;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.boot.autoconfigure.web.reactive.function.client.ReactorNettyHttpClientMapper;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.web.reactive.function.client.WebClientCustomizer;
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
public class IntegrationConfig {
    Appkey appkey;
    Duration connectTimout = Duration.ofSeconds(30);
    Duration readTimout = Duration.ofSeconds(30);

    String clientId;
    String clientSecret;

    ApiHttp restBase;


    @Bean
    @ConditionalOnMissingBean(HttpClientCustomizers.class)
    public HttpClientCustomizers httpClientCustomizers(ObjectProvider<ReactorNettyHttpClientMapper> mapperProvider,
                                                       ObjectProvider<WebClientCustomizer> webClientCustomizerProvider,
                                                       @Autowired(required = false) ReactorResourceFactory resourceFactory) {

        return new HttpClientCustomizers(mapperProvider, webClientCustomizerProvider, resourceFactory);
    }


//    @Bean
//    @ConditionalOnMissingBean({WebClient.Builder.class})
    public WebClient.Builder webClientBuilder(HttpClientCustomizers httpClientCustomizers) {
        return httpClientCustomizers.customizeWebClientBuilderAndApplyCustomizerProvider(WebClient.builder(),
                httpClientCustomizers.compress().andThen(httpClientCustomizers.followRedirect(true))
                        .andThen(httpClientCustomizers.connectTimout(connectTimout))
                        .andThen(httpClientCustomizers.readTimout(readTimout)));
    }

    @Bean
    public AccessSecret appSecret(){
        return AccessSecret.builder()
                .grantType(GrantType.CLIENT_CREDENTIALS)
                .clientId(clientId)
                .clientSecret(clientSecret)
                .build();
    }

    @Bean
    public EasemobApi easemobApi(HttpClientCustomizers httpClientCustomizers){
        return new EasemobApiProvider(appkey, this::appSecret, () -> webClientBuilder(httpClientCustomizers), (count) -> restBase, serverApiOk -> {});
    }
}
