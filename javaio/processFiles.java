package javaio;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

public class processFiles {
    public interface Strategy{
        void process(File file);
    }
    private Strategy strategy;
    private String ext;
    public processFiles(Strategy strategy, String ext){
        this.strategy = strategy;
        this.ext = ext;
    }
    public void start(String ...files){
        if (files.length == 0){
            processDirectoryTree(new File("."));
        }else{
            Arrays.stream(files).forEach(fileName ->
            {
                File ifile = new File(fileName);
                if (ifile.isDirectory()){
                    processDirectoryTree(ifile);
                }else{
                    if (fileName.endsWith("." + ext)){
                        try {
                            strategy.process(ifile.getCanonicalFile());
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    }
                }
            });
        }
    }
    //遍历root目录下的目标后缀文件，strategy单个处理。
    public void processDirectoryTree(File root){
        System.out.println(root.getAbsolutePath());//绝对路径
        //TODO 正则表达式.*\.
        for (File file : FileUtils.walk(root.getAbsolutePath(), ".*\\." + this.ext)) {
            strategy.process(file);
        }
    }
    //计算目录下ext后缀的文件大小及求和
    public void calcFileSize(File root){
        List<File> files = FileUtils.walk(root.getAbsolutePath(), ".*\\." + this.ext).files;
        files.stream().forEach(file -> System.out.println(file.getName() + " : " + file.length()));
        long fileSize = files.stream()
                .mapToLong(file -> file.length())
                .sum();
        System.out.println(fileSize);
    }

    public static void main(String[] args) {
        new processFiles(file -> System.out.println(file), "java").start();
        new processFiles(null, "txt").calcFileSize(new File("."));
    }
}