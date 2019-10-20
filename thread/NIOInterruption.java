package thread;

import java.io.IOException;
import java.net.InetSocketAddress;
import java.net.ServerSocket;
import java.nio.ByteBuffer;
import java.nio.channels.AsynchronousCloseException;
import java.nio.channels.ClosedByInterruptException;
import java.nio.channels.SocketChannel;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;

public class NIOInterruption
{
    public static void main(String[] args) throws Exception {
        ExecutorService service = Executors.newCachedThreadPool();
        ServerSocket server = new ServerSocket(8080);
        InetSocketAddress isa = new InetSocketAddress("localhost", 8080);
        SocketChannel sc1 = SocketChannel.open(isa);
        SocketChannel sc2 = SocketChannel.open(isa);
        Future<?> f = service.submit(new NIOBlocked(sc1, "sc1"));
        service.execute(new NIOBlocked(sc2, "sc2"));
        //这里调用shutdown没有任何作用，但是shutdownNow可以以ClosedByInterruptException方法中断所有线程。
        service.shutdown();
        TimeUnit.SECONDS.sleep(1);
        f.cancel(true);
        TimeUnit.SECONDS.sleep(1);
        sc2.close();//通过关闭资源来退出。
    }
}
class NIOBlocked implements Runnable
{
    private final SocketChannel sc;
    private String name;
    public NIOBlocked(SocketChannel sc, String name)
    {
        this.sc = sc;
        this.name = name;
    }

    @Override
    public String toString() {
        return this.name;
    }

    @Override
    public void run() {
        try {
            System.out.println("waiting for read() in " + this);
            sc.read(ByteBuffer.allocate(1));
        }catch (ClosedByInterruptException e)
        {
            System.out.println("ClosedByInterruptException");
        }catch (AsynchronousCloseException e)
        {
            System.out.println("AsynchronousCloseException");
        }catch (IOException e)
        {
            throw new RuntimeException(e);
        }
        System.out.println("exiting NIOBlocked.run() " + this);
    }
}
