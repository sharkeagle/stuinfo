package org.example.stukc.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.stereotype.Component;

import java.io.*;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
@Component
public class Recovery {
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
    public boolean recoverDatabase() throws IOException {
        File file = new File("D:/stukc/backups/");
        //用数组把文件夹下的文件存起来
        File[] files = file.listFiles();
        String a;
        if (files != null) {
            a=files[0].getName();
        }
        else{
            return  false;
        }
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("mysql -h").append("localhost").append(" -u").append("root").append(" -p").append("25252525p");
        stringBuilder.append(" ").append("gbook").append(" < ").append("D:/stukc/backups/"+a);
        try {
            Process process = Runtime.getRuntime().exec(getCommand(stringBuilder.toString()));
            if (process.waitFor() == 0) {
                System.out.println("数据已从 " + this.dir + " 导入到数据库中");
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
