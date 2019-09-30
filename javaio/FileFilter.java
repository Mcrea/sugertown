package javaio;

import java.io.File;
import java.util.Arrays;

public class FileFilter {
    public static void main(String[] args) {

        File file = new File(".");//这里指的是thinkInJ目录
        File file2 = new File("./src");
        String[] fileNameList = file.list();
        running(fileNameList);
        running(file2.list((File dir, String name) -> name.endsWith("java")));//dir是指file2，name参数才是元素的名字
        running(file2.listFiles(ifile -> ifile.isFile()));
        System.out.println(FileUtils.walk("./src"));


    }
    //输出文件的名称
    static void running(String ...fileNameList){
        if (fileNameList == null) {
            System.out.println("oh no");
        }else{
            System.out.println(fileNameList.length);
            Arrays.sort(fileNameList, String.CASE_INSENSITIVE_ORDER);//数组排序
            Arrays.stream(fileNameList).forEach(s -> System.out.println(s));
        }
    }
    //读取文件的大小并求和
    static void running(File ...fileList){
        if (fileList == null) {
            System.out.println("oh no");
        }else{
            System.out.println(fileList.length);
            long sum = Arrays.stream(fileList)
                    .filter(file -> file.isFile())
                    .mapToLong(file -> file.length())
                    .sum();
            System.out.println(sum);
        }
    }

}
