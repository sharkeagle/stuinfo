//package org.example.stukc.service;
//
//import java.nio.file.Path;
//import java.util.concurrent.TimeUnit;
//
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.scheduling.annotation.Scheduled;
//import org.springframework.stereotype.Component;
//
//@Component
//public class BackupTask {
//
//    static final Logger log = LoggerFactory.getLogger(BackupTask.class);
//
//    @Autowired
//    private BackupService backupService;
//
//    // 1 分钟执行一次
//    @Scheduled(fixedRate = 30, timeUnit = TimeUnit.MINUTES)
//    public void backup () {
//
//        try {
//
//            Path file = this.backupService.backup();
//
//            log.info("备份成功：{}", file.toAbsolutePath().toString());
//
//        } catch (Exception e) {
//            log.error("备份任务执行异常： {}", e.getMessage());
//        }
//    }
//}
