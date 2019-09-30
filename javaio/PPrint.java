package javaio;

import java.io.File;
import java.util.List;

public class PPrint {
    public static String printTree(FileUtils.TreeInfo tree){
        List<File> files = tree.files;
        List<File> dirs = tree.dirs;
        String filesName = files.stream().map(file -> file.getName())
                .reduce("", (prevName, name) -> prevName + "\n" + name);
        String dirsName = dirs.stream().map(dir -> dir.getName())
                .reduce("", (prevName, name) -> prevName + "\n" + name);
        return "filesName : " + filesName + ", dirsName : " + dirsName;
    }
}
