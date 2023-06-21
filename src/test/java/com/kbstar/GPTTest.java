package com.kbstar;

import io.github.flashvayne.chatgpt.service.ChatgptService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import java.text.ParseException;

@Slf4j
@SpringBootTest
class GPTTest {

    @Autowired
    ChatgptService chatgptService;
    @Test
    void contextLoads() throws ParseException {
        String str = chatgptService.sendMessage("한국에서 가장 유명한것이 뭐니");
        log.info("------------------------------------");
        String imageUrl = chatgptService.imageGenerate("boy");
    }

}