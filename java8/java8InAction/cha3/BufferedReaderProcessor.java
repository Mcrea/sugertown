package java8.cha3;

import java.io.BufferedReader;
import java.io.IOException;

public interface BufferedReaderProcessor {
    String process(BufferedReader br) throws IOException;//抛出异常是必须的
}
