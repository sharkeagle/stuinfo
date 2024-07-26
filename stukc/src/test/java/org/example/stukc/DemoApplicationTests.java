package org.example.stukc;

import java.nio.file.Path;

import org.example.stukc.service.BackupService;
import org.example.stukc.service.Recovery;
import org.example.stukc.service.newBackup;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.context.SpringBootTest.WebEnvironment;


@SpringBootTest(webEnvironment = WebEnvironment.RANDOM_PORT)
public class DemoApplicationTests {


    @Autowired
    BackupService backupService;
    @Autowired
    newBackup a;
    @Autowired
    Recovery b;
    @Test
    public void test() throws Exception {

        a.backDatabase();
        b.recoverDatabase();

    }
}