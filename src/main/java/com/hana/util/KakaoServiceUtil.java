package com.hana.util;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.Charset;

public class KakaoServiceUtil {

    public static Object getServiceData(String key, String searchTarget) throws IOException, ParseException {

        String address = "https://dapi.kakao.com/v2/local/search/keyword.json?query=" + URLEncoder.encode(searchTarget, "UTF-8");

//        String param = "?query=" + searchTarget;
//        System.out.println(address);

        URL url = new URL(address);  			//접속할 url 설정
        HttpURLConnection conn;					//httpURLConnection 객체
        conn = (HttpURLConnection) url.openConnection();	//접속할 url과 네트워크 커넥션을 연다.
        conn.setRequestMethod("POST");
        conn.setDoOutput(true);
        conn.setUseCaches(false);
        conn.setRequestProperty("Authorization", "KakaoAK " + key);	//Property 설정

        conn.setDoOutput(true);

        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }

        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
//        System.out.println(sb.toString());

        JSONParser jsonParser = new JSONParser();
        JSONObject jsonObject = (JSONObject) jsonParser.parse(sb.toString());

        return jsonObject;

//        OutputStreamWriter ds = new OutputStreamWriter(conn.getOutputStream());
//        ds.write(param);
//        ds.flush();
//        ds.close();
//
//
//        int responseCode = conn.getResponseCode();		//responseCode를 받아옴.
//
//        InputStream inputStream = conn.getInputStream();	//데이터를 받아오기 위한 inputStream
//        BufferedReader br;		//inputStream으로 들어오는 데이터를 읽기 위한 reader
//        String json = null;
//        Charset charset = Charset.forName("UTF-8");
//        if(responseCode == 200) {
//            br = new BufferedReader(new InputStreamReader(inputStream,charset));
//            json = br.readLine();
//            br.close();
//        }
//        else {
//            System.out.println(" ERROR !!! ");
//        }
//
//        inputStream.close();
//        conn.disconnect();
//        System.out.println(json);
    }
}
