package javaio;

import java.io.*;
import java.util.ArrayList;
import java.util.Arrays;

public class TextFile extends ArrayList<String> {
    public static String read(String fileName){
        StringBuilder sb = new StringBuilder();
        try {
            BufferedReader bufferedReader = new BufferedReader(
                    new FileReader(new File(fileName).getAbsoluteFile()));
            try {
                String s = null;
                while ((s = bufferedReader.readLine()) != null){
                    sb.append(s).append("\n");
                }
            }finally {
                bufferedReader.close();
            }
        } catch(IOException e){
            e.printStackTrace();
        }
        return sb.toString();
    }
    public static void write(String fileName, String context){
        try {
            PrintWriter printWriter = new PrintWriter(new File(fileName).getAbsoluteFile());
            try {
                printWriter.print(context);
//                printWriter.flush();
            }finally {
                printWriter.close();
            }
        } catch(IOException e){
            e.printStackTrace();
        }
    }
    public TextFile(String fileName, String splitter){
        super(Arrays.asList(read(fileName).split(splitter)));
        //使用正则表达式执行split方法时经常会在第一个位置留下一个空，需要处理一下。
        if ("".equals(get(0))){
            remove(0);
        }
    }
    public TextFile(String fileName){
        this(fileName, "\n");
    }
    public void write(String fileName){
        try {
            PrintWriter printWriter = new PrintWriter(new File(fileName).getAbsoluteFile());
            try {
                for (String item : this){
                    printWriter.println(item);
                }
            }finally {
                printWriter.close();
            }
        } catch(IOException e){
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        String context = TextFile.read("./src/javaio/booknote.txt");
        System.out.println(context);
        TextFile textFile = new TextFile("./src/javaio/booknote.txt");
        System.out.println(textFile.size());
    }
}
