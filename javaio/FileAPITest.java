package javaio;

import java.io.File;
import java.util.Date;

public class FileAPITest {
    public static void showFileAttr(File file){
        System.out.println("Absolute path : " + file.getAbsolutePath());
        System.out.println("can read : " + file.canRead());
        System.out.println("can write : " + file.canWrite());
        System.out.println("getName : " + file.getName());
        System.out.println("getParent : " + file.getParent());
        System.out.println("getPath : " + file.getPath());
        System.out.println("length : " + file.length());
        Date lastModifiedTime = new Date(file.lastModified());
        System.out.println("lastModifiedTime : " + lastModifiedTime.toString());
        System.out.println("lastModified : " + file.lastModified());
        System.out.println("file or directory : "
                + (file.isFile() ? "file"
                : file.isDirectory() ? "directory" : "neither file or directory"));
    }
    public static void mkdir(File root){
        if (!root.exists()){
            root.mkdirs();//创建路径上的所有目录,mkdir只能创建当前目录
            FileAPITest.showFileAttr(root);
        }
    }
    public static void rmdir(File root){
        if (root.exists()){
            root.delete();//无法及联删除
            System.out.println("root is delete");
        }
    }

    public static void main(String[] args) {
        FileAPITest.showFileAttr(new File("./src/Input.java"));//文件名需要带后缀
        FileAPITest.mkdir(new File("./mkdirTest/mkdirs"));
        FileAPITest.rmdir(new File("./mkdirTest/mkdirs"));
    }
}
