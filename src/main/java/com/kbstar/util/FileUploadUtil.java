package com.kbstar.util;

import org.springframework.web.multipart.MultipartFile;

import java.io.FileOutputStream;

public class FileUploadUtil {
    public static void saveFile(MultipartFile mf, String dir, String imgname) {
        byte[] data;
        try {
            data = mf.getBytes();
            FileOutputStream fo =
                    new FileOutputStream(dir + imgname);
            fo.write(data);
            fo.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void saveOcrFile(MultipartFile mf, String dir) {
        byte[] data;
        String imgname = mf.getOriginalFilename();
        try {
            data = mf.getBytes();
            FileOutputStream fo =
                    new FileOutputStream(dir + imgname);
            fo.write(data);
            fo.close();
        } catch (Exception e) {

        }
    }

    public static void saveProfFile(MultipartFile mf, String dir) {
        byte [] data;
        String imgname = mf.getOriginalFilename();
        try {
            data = mf.getBytes();
            FileOutputStream fo =
                    new FileOutputStream(dir+imgname);
            fo.write(data);
            fo.close();
        }catch(Exception e) {
            e.printStackTrace();
        }
    }

}