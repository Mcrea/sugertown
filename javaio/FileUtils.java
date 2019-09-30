package javaio;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.regex.Pattern;

//目录实用工具
public class FileUtils {
    //过滤名称符合正则表达式的文件或目录，当前目录下
    public static final File[] local(File dir, final String regexp){
        Pattern pattern = Pattern.compile(regexp);
        return dir.listFiles((idir, name) ->
            pattern.matcher(name).matches());
    }
    //过滤名称符合正则表达式的文件或目录，当前目录下
    public static final File[] local(String path, final String regexp){
        return local(new File(path), regexp);
    }

    //遍历当前目录的所有子文件和子目录
    public static TreeInfo walk(String start, String regexp){
        return recurseDirs(new File(start), regexp);
    }
    public static TreeInfo walk(File start, String regexp){
        return recurseDirs(start, regexp);
    }
    public static TreeInfo walk(File start){
        return recurseDirs(start, ".*");
    }
    public static TreeInfo walk(String start){
        return recurseDirs(new File(start), ".*");
    }
    private static TreeInfo recurseDirs(File startDir, String regexp){
        TreeInfo result = new TreeInfo();
        Arrays.stream(startDir.listFiles())
                .forEach(file -> {
                    if (file.isDirectory()){
                        result.dirs.add(file);
                        result.addAll(recurseDirs(file, regexp));
                    }else{
                        if (file.getName().matches(regexp)){
                            result.files.add(file);
                        }
                    }
                });
        return result;
    }

    public static class TreeInfo implements Iterable<File>{
        public List<File> files = new ArrayList<>();
        public List<File> dirs = new ArrayList<>();
        @Override
        public Iterator<File> iterator() {
            return files.iterator();
        }
        void addAll(TreeInfo other){
            files.addAll(other.files);
            dirs.addAll(other.dirs);
        }

        @Override
        public String toString() {
            return PPrint.printTree(this);
        }
    }
}
