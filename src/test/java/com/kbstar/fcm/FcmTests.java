package com.kbstar.fcm;

import com.kbstar.util.PushNotificationUtil;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import java.io.IOException;

@Slf4j
@SpringBootTest
class FcmTests {

    @Autowired
    private PushNotificationUtil pushNotificationUtil;
    String userToken = "eJqBEpgeRYey1KxcQ5d88W:APA91bFb566XCq2SThdatny14tx4iyJfbsjxE5dBjR1cQJ8we0H2lvzYWWFAW2d2WL98A_ycCiFIjVV94Dkdr1_GrqvLxvV1Hpi0jgSHoPcjrToJPhd1zX-l48QJIMBVu1sEOWN3d_Yg";
    String imgUrl = "https://www.w3schools.com/css/img_5terre.jpg";
    @Test
    void contextLoads() throws IOException {

//        pushNotificationUtil.sendCommonMessage("SPRING ", "hello", "/register", imgUrl);
          pushNotificationUtil.sendTargetMessage("A comment is registered.", "ㅋㅋㅋ", "/register", userToken);

    }

}