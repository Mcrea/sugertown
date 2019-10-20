package javaio;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.RandomAccessFile;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;

public class GetChannel {
    private static final int BSIZE = 1024;

    public static void main(String[] args) throws Exception{
        FileChannel fc = new FileOutputStream("./src/javaio/channelData.txt").getChannel();
        fc.write(ByteBuffer.wrap("Alex".getBytes()));
        fc.close();

        fc = new RandomAccessFile("./src/javaio/channelData.txt", "rw").getChannel();
        fc.position(fc.size());
        fc.write(ByteBuffer.wrap("is smart".getBytes()));
        fc.close();

        fc = new FileInputStream("./src/javaio/channelData.txt").getChannel();
        ByteBuffer byteBuffer = ByteBuffer.allocate(BSIZE);
        fc.read(byteBuffer);
        byteBuffer.flip();
        while (byteBuffer.hasRemaining()){
            System.out.print((char)byteBuffer.get());
        }
    }
}
