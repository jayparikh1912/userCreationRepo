package com.staff.mgmt.fileUpload.Client;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.staff.mgmt.fileUpload.Dto.StaffDTO;
import lombok.extern.slf4j.Slf4j;
import okhttp3.*;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
import java.io.IOException;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.util.concurrent.TimeUnit;

@Component
@Slf4j
public class StaffClient {

    private final RestTemplate restTemplate;

    public StaffClient(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }

    public static OkHttpClient getUnsafeOkHttpClient() {
        try {
            // Create a trust manager that does not validate certificate chains
            final TrustManager[] trustAllCertificates = new TrustManager[]{
                    new X509TrustManager() {
                        @Override
                        public void checkClientTrusted(X509Certificate[] chain, String authType) throws CertificateException {
                        }

                        @Override
                        public void checkServerTrusted(X509Certificate[] chain, String authType) throws CertificateException {
                        }

                        @Override
                        public X509Certificate[] getAcceptedIssuers() {
                            return new X509Certificate[]{};
                        }
                    }
            };

            // Install the all-trusting trust manager
            final SSLContext sslContext = SSLContext.getInstance("TLS");
            sslContext.init(null, trustAllCertificates, new java.security.SecureRandom());

            // Create an SSL socket factory with our all-trusting manager
            final SSLSocketFactory sslSocketFactory = sslContext.getSocketFactory();

            return new OkHttpClient.Builder()
                    .sslSocketFactory(sslSocketFactory, (X509TrustManager) trustAllCertificates[0])
                    .hostnameVerifier((hostname, session) -> true) // Ignore hostname verification
                    .connectTimeout(30, TimeUnit.SECONDS)
                    .readTimeout(30, TimeUnit.SECONDS)
                    .writeTimeout(30, TimeUnit.SECONDS)
                    .build();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public void createStaff(StaffDTO staffDTO) throws IOException {
        try {
            OkHttpClient client = getUnsafeOkHttpClient();

            String url = "https://salestest.alyasra.com/alyasra-staff-management/api/v1/staffs";
            String token = "Bearer eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJnN1FtSGd1V1QxSWR5U2E2NTJsSWV6Rm5uSW04Ykk4TmZFMmRMbnlweTRJIn0.eyJleHAiOjE3NDE2Mjc2ODIsImlhdCI6MTc0MTU5MTY4MiwiYXV0aF90aW1lIjoxNzQxNTkxNjgxLCJqdGkiOiJiNGZjZTI1OS04ZjZmLTRjMjMtYjQzNi03ZGE3M2FhNGFmMTYiLCJpc3MiOiJodHRwczovL3NhbGVzdGVzdC5hbHlhc3JhLmNvbS9rZXljbG9hay9hdXRoL3JlYWxtcy9hbHlhc3JhIiwiYXVkIjpbInJlYWxtLW1hbmFnZW1lbnQiLCJhY2NvdW50Il0sInN1YiI6ImE3ZDNjZThmLWE0NzctNGFjNC05Y2JmLWIxMTM3OWQyZWJmZCIsInR5cCI6IkJlYXJlciIsImF6cCI6ImFseWFzcmEtcG9ydGFsIiwibm9uY2UiOiIwMDZmZjExYS1kMjhhLTQzZTUtODQzNi1hN2Q3N2QxNDlmYTgiLCJzZXNzaW9uX3N0YXRlIjoiZjY2ZTNmOTctMjdjMy00Zjc4LWFhZDgtYjM4MWM1ZjZmMzgwIiwiYWNyIjoiMSIsImFsbG93ZWQtb3JpZ2lucyI6WyJodHRwczovL3NhbGVzdGVzdC5hbHlhc3JhLmNvbSJdLCJyZWFsbV9hY2Nlc3MiOnsicm9sZXMiOlsib2ZmbGluZV9hY2Nlc3MiLCJhcm46YXdzOmlhbTo6MTc0MDM0MTI2OTczOnJvbGUvQ29tbWVyY2VQbGF0Zm9ybVFTVGVzdCIsInN5c0FkbWluIiwidW1hX2F1dGhvcml6YXRpb24iLCJkZWZhdWx0LXJvbGVzLWFseWFzcmEiXX0sInJlc291cmNlX2FjY2VzcyI6eyJyZWFsbS1tYW5hZ2VtZW50Ijp7InJvbGVzIjpbInZpZXctcmVhbG0iLCJtYW5hZ2UtcmVhbG0iLCJtYW5hZ2UtdXNlcnMiLCJxdWVyeS1yZWFsbXMiLCJ2aWV3LXVzZXJzIiwidmlldy1jbGllbnRzIiwicXVlcnktY2xpZW50cyIsIm1hbmFnZS1jbGllbnRzIiwicXVlcnktZ3JvdXBzIiwicXVlcnktdXNlcnMiXX0sImFjY291bnQiOnsicm9sZXMiOlsibWFuYWdlLWFjY291bnQiLCJ2aWV3LWdyb3VwcyIsIm1hbmFnZS1hY2NvdW50LWxpbmtzIiwidmlldy1wcm9maWxlIl19fSwic2NvcGUiOiJvcGVuaWQgZW1haWwgcHJvZmlsZSIsInNpZCI6ImY2NmUzZjk3LTI3YzMtNGY3OC1hYWQ4LWIzODFjNWY2ZjM4MCIsImVtYWlsX3ZlcmlmaWVkIjp0cnVlLCJ0ZW5hbnRJZCI6IjEiLCJmdWxsTmFtZSI6IkFseWFzcmEgQWRtaW4iLCJwcmVmZXJyZWRfdXNlcm5hbWUiOiJhbHlhc3JhLWFkbWluIiwiZGVzaWduYXRpb24iOiJTeXN0ZW0gQWRtaW5pc3RyYXRpb24iLCJ1c2VySWQiOiJjYjA0MTQ4Ni1lNzIxLTQwMjUtYTQwZS0yOGQwYTMwYjk1NjQiLCJzdGFmZklkIjoiOGUwMDFhNTgtYzU0Yy00MDg3LWJjY2YtNmRhOWRlMmUwMjVhIiwib3JnSWQiOiI4MiJ9.dV7O-4GCbwD1chiFX9G3_OkQgVvbkjPsMUfmwUUaFQ_6r4tdagOoiHhEwTVfOAa-MQJi6zt9W13tKzfv0KnBnue108KSnczUUr9RrGhF6yy3I3ZvM6JGtiSye2cJOYmPRNCtp0dBxRVOSNMYNHRL5ug3insWq21wIAr2oDXpaviRFboM6FHT7vIz47eytDeD7F1M_flXUAp81OYCVfglIt4-rfWpRo5pCXBvqwRLgbEoqNq27SDAb7CIrZ3JoneRFLrY1-z51wivTlGYpnTr7azPKYLwxDGfE3k7ey7A_P3TKfGr7gD36S-G2xCEQmalCvFvQ9HQ6VcQsUEYLWKQ2g";
            // JSON Payload (Modify as per your requirements)
            String jsonPayload = new ObjectMapper().writeValueAsString(staffDTO);

            RequestBody body = RequestBody.create(jsonPayload, MediaType.get("application/json"));

            Request request = new Request.Builder()
                    .url(url)
                    .post(body)
                    .addHeader("Authorization", token)
                    .addHeader("Content-Type", "application/json")
                    .build();

            Response response = client.newCall(request).execute();
            if (response.isSuccessful()) {
                assert response.body() != null;
                System.out.println("Success: " + response.body().string());
            } else {
                System.out.println("Failed: " + response.code() + " " + response.message());
            }
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }
    }

/*
    public void createStaff(StaffDTO staffDto) throws Exception {
        try {
            String STAFF_BASE_URL = "https://salestest.alyasra.com/alyasra-staff-management/api/v1";
//            String STAFF_BASE_URL = "http://192.168.0.121:50091/staff/api/v1";
            String url = STAFF_BASE_URL + "/staffs";
            HttpHeaders headers = new HttpHeaders();
            String token = "Bearer eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJnN1FtSGd1V1QxSWR5U2E2NTJsSWV6Rm5uSW04Ykk4TmZFMmRMbnlweTRJIn0.eyJleHAiOjE3NDEzNzg4MDEsImlhdCI6MTc0MTM0MjgwMSwiYXV0aF90aW1lIjoxNzQxMzMyNDk0LCJqdGkiOiJmYzVjYzUyMS05NmI3LTQ1YmQtOWNjNS03YzE2ZDJjOGZkMjMiLCJpc3MiOiJodHRwczovL3NhbGVzdGVzdC5hbHlhc3JhLmNvbS9rZXljbG9hay9hdXRoL3JlYWxtcy9hbHlhc3JhIiwiYXVkIjpbInJlYWxtLW1hbmFnZW1lbnQiLCJhY2NvdW50Il0sInN1YiI6ImE3ZDNjZThmLWE0NzctNGFjNC05Y2JmLWIxMTM3OWQyZWJmZCIsInR5cCI6IkJlYXJlciIsImF6cCI6ImFseWFzcmEtcG9ydGFsIiwibm9uY2UiOiJjYzU0MmZjNi0zZWRmLTRmN2ItOWRkZC05OThlYTQzMzFmN2MiLCJzZXNzaW9uX3N0YXRlIjoiMWIyM2E0ZDQtZWNjNS00YTdkLThjZGItZGVmNDg3OGNjZDQyIiwiYWNyIjoiMCIsImFsbG93ZWQtb3JpZ2lucyI6WyJodHRwczovL3NhbGVzdGVzdC5hbHlhc3JhLmNvbSJdLCJyZWFsbV9hY2Nlc3MiOnsicm9sZXMiOlsib2ZmbGluZV9hY2Nlc3MiLCJhcm46YXdzOmlhbTo6MTc0MDM0MTI2OTczOnJvbGUvQ29tbWVyY2VQbGF0Zm9ybVFTVGVzdCIsInN5c0FkbWluIiwidW1hX2F1dGhvcml6YXRpb24iLCJkZWZhdWx0LXJvbGVzLWFseWFzcmEiXX0sInJlc291cmNlX2FjY2VzcyI6eyJyZWFsbS1tYW5hZ2VtZW50Ijp7InJvbGVzIjpbInZpZXctcmVhbG0iLCJtYW5hZ2UtcmVhbG0iLCJtYW5hZ2UtdXNlcnMiLCJxdWVyeS1yZWFsbXMiLCJ2aWV3LXVzZXJzIiwidmlldy1jbGllbnRzIiwicXVlcnktY2xpZW50cyIsIm1hbmFnZS1jbGllbnRzIiwicXVlcnktZ3JvdXBzIiwicXVlcnktdXNlcnMiXX0sImFjY291bnQiOnsicm9sZXMiOlsibWFuYWdlLWFjY291bnQiLCJ2aWV3LWdyb3VwcyIsIm1hbmFnZS1hY2NvdW50LWxpbmtzIiwidmlldy1wcm9maWxlIl19fSwic2NvcGUiOiJvcGVuaWQgZW1haWwgcHJvZmlsZSIsInNpZCI6IjFiMjNhNGQ0LWVjYzUtNGE3ZC04Y2RiLWRlZjQ4NzhjY2Q0MiIsImVtYWlsX3ZlcmlmaWVkIjp0cnVlLCJ0ZW5hbnRJZCI6IjEiLCJmdWxsTmFtZSI6IkFseWFzcmEgQWRtaW4iLCJwcmVmZXJyZWRfdXNlcm5hbWUiOiJhbHlhc3JhLWFkbWluIiwiZGVzaWduYXRpb24iOiJTeXN0ZW0gQWRtaW5pc3RyYXRpb24iLCJ1c2VySWQiOiJjYjA0MTQ4Ni1lNzIxLTQwMjUtYTQwZS0yOGQwYTMwYjk1NjQiLCJzdGFmZklkIjoiOGUwMDFhNTgtYzU0Yy00MDg3LWJjY2YtNmRhOWRlMmUwMjVhIiwib3JnSWQiOiI4MiJ9.X9NwO7HWQmkS8w7tzcUjeUKfz2nJEkfeHfO6U9UuPt0y8G6n5ok8sMBpMSDn8-dUzg1N2-8vjbsY-wmgfLL1RpyXh1IubrpXX6Bkq_3wF-g44uyieh7pEF0jXvBlXlrERNGu8I-5i6ecxDFE2QSEveTq4ph6sJjAnDRnOpufJqkatmLxGKmYyMJwDYIw-Ya3kRvb6H4dbx1dIQm1mLkRoxFyGv0DLnwICLjewXJAZ4nC9G5YeJvzKxYJN_iIQgjYoK_g3aWQmlGhPVhBUWnSwmsy0A6qQF6furO-EJTF2Q0IossiwCXl6jMVgtXCH-DPOQjmXwjROGszFYRffCA2Bg";
            headers.set("Authorization", token) ;
            headers.setContentType(MediaType.APPLICATION_JSON);
            HttpEntity<StaffDTO> entity = new HttpEntity<>(staffDto, headers);
            ResponseEntity<GenericDataDto> response = restTemplate.exchange(url.trim(), HttpMethod.POST, entity, GenericDataDto.class);
            if (null != response.getBody() && response.getStatusCode().is2xxSuccessful()) {
                System.out.println("Success");
            }
        } catch (Exception ex) {
            log.error(ex.getMessage(), ex);
            throw ex;
        }
    }
*/

}
