package com.hana.data;

import lombok.Getter;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class KeyStore {

    @Value("${app.key.psKey}")
    public String publicServiceKey; // 서울시 공공서비스 key

    @Value("${app.key.kakaoKey}")
    public String kakaoServiceKey; // 카카오 api key

    @Value("${app.key.kakaoApiKey}")
    public String kakaoApiServiceKey;
}
