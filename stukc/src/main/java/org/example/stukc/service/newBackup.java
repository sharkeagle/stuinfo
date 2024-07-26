package org.example.stukc.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.stereotype.Component;

import java.io.File;
import java.io.IOException;
@Component
public class newBackup {
    @Value("${app.backup.dir}")
    private String dir;


    public DriverManagerDataSource dataSource() {
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName("com.mysql.jdbc.Driver");
        dataSource.setUrl("jdbc:mysql://localhost:3306");
        dataSource.setUsername("root");
        dataSource.setPassword("25252525p");
        return dataSource;
    }

    private static String[] getCommand(String command) {
        String shell = "cmd";
        String c = "/c";
        String[] cmd = { shell, c, command };
        return cmd;
    }
    //这个方法比第一个好，执行时不会卡  stmt要执行的命令
    public boolean backDatabase() throws IOException {
        //用数组把文件夹下的文件存起来
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("mysqldump").append(" -u").append("root").append(" -p").append("25252525p").append(" -R");
        stringBuilder.append(" ").append("student").append(" > ").append("D:/stukc/backups/back.sql");
        try {
            Process process = Runtime.getRuntime().exec(getCommand(stringBuilder.toString()));
            if (process.waitFor() == 0) {
                System.out.println("数据已备份到 " + this.dir );
            }
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }
        return true;

    }
}