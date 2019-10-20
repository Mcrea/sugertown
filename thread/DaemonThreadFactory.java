package thread;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.TimeUnit;

public class DaemonThreadFactory implements ThreadFactory
{
    @Override
    public Thread newThread(Runnable r) {
        Thread t = new Thread(r);
        t.setDaemon(true);
        return t;
    }

    public static void main(String[] args) throws Exception{
        ExecutorService service = Executors.newCachedThreadPool(new DaemonThreadFactory());
        for (int i = 0;i < 10;i++)
        {
            service.execute(new SimpleDaemons());
        }
        System.out.println("all daemons started");
        TimeUnit.MILLISECONDS.sleep(1000);
    }
}
