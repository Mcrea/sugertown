package thread;

import java.util.concurrent.TimeUnit;

public class Daemons
{
    public static void main(String[] args) throws Exception
    {
        Thread t = new Thread(new Daemon());
        t.setDaemon(true);
        t.start();
        System.out.println("t.isDaemon() = " + t.isDaemon());
        TimeUnit.MILLISECONDS.sleep(1);
    }

}
class Daemon implements Runnable
{
    private Thread[] ts = new Thread[10];
    @Override
    public void run()
    {
        for (int i = 0;i < 10;i++)
        {
            ts[i] = new Thread(new DaemonSpawn());
            ts[i].start();
            System.out.println("DaemonSpawn " + i + " started");
        }
        for (int i = 0;i < 10;i++)
        {
            System.out.println("ts[" + i + "].isDaemon() = " + ts[i].isDaemon() + ",");
        }
        while (true)
        {
            Thread.yield();
        }
    }
}
class DaemonSpawn implements Runnable
{
    @Override
    public void run() {
        while (true)
        {
            Thread.yield();
        }
    }
}
