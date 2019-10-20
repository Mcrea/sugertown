package thread;

import java.util.concurrent.TimeUnit;

public class DaemonDontRunFinally
{
    public static void main(String[] args) {
        Thread t = new Thread(new ADaemon());
//        t.setDaemon(true);
        t.start();
    }
}
class ADaemon implements Runnable
{
    @Override
    public void run() {
        try
        {
            System.out.println("ADaemon starting");
            TimeUnit.MILLISECONDS.sleep(1);
        }
        catch (Exception e)
        {
            System.out.println(e.toString());
        }
        finally
        {
            System.out.println("this should always run?");
        }
    }
}
