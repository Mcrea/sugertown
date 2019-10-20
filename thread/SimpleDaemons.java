package thread;

import java.util.concurrent.TimeUnit;

public class SimpleDaemons implements Runnable
{
    @Override
    public void run()
    {
        try
        {
            while (true)
            {
                TimeUnit.MILLISECONDS.sleep(1000);
                System.out.println(Thread.currentThread() + "" +this);
            }
        }
        catch (Exception e)
        {

        }
    }

    public static void main(String[] args) throws Exception{
        for (int i = 0;i < 10;i++)
        {
            Thread t = new Thread(new SimpleDaemons());
            t.setDaemon(true);
            t.start();
        }
        System.out.println("all daemons started");
        TimeUnit.MILLISECONDS.sleep(100);
    }
}
